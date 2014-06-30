local version = "0.5"
--[[
Script Name: Neo's Little Helper
Author: Neo
Version: 0.5
Revision Date: June 30, 2014
Purpose: Overhead hud-integrated cooldown tracker and general utility
--------------------------------------------------------------
@Future features planned: 
	- Suggestions ?
--------------------------------------------------------------
Version 0.5 
						- Created github repo
						- Added autoupdate
--------------------------------------------------------------
Version 0.4
						- Added 'fog of war' recall exploit warning for VIP's
--------------------------------------------------------------
Version 0.3
						- Added team cooldowns
						- Improved hud some more
						- Cleaned up the code a bit
--------------------------------------------------------------
Version 0.21
						- Fixed SUMMONER_2 position issue
						- Improved timer positions
--------------------------------------------------------------
Version 0.2 
						- Added hud-integraded levels for each skill
						- Improved hud visuals
						- Improved cooldown drawing accuracy
--------------------------------------------------------------
Version 0.1 
						- Initial release
--------------------------------------------------------------
]]
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAR12AAAAAQAAAEMAgACBQAAAwYAAAAHBAABBAQEAhkFBAIeBQQPBwQEAAQICAJ2BgAEWgQECRkFCAIaBQgCdgYAAh8FCA1aBgQKBAQMAwAGAAQACAAKWAQID5QEAAAjAgYblQQAACMABh8HBAwAEAoABAwMAAEMDAACLAwADxgNEAAZERABGhEQAhsREAMYERQAGRUUApEMAA8sDgAYLhAAACsRFiwpERoxLhAAASoRGi0rERoyLhAAAigRHi4pER4zLhAAAyoRHi8rER4wLhQAACgVIiwpFSIxLhQAASoVIi0rFSIyLhQAAigVJi4pFSYzLhQAAyoVJi8rFSYwLhgAACgZKiwpGSoxLhgAASoZKi0rGSoyLhgAAigZLi4pGS4zLhgAAyoZLi8rGS4wLhwAACgdMiwpHTIzkQ4AGCwQAAEsEAAClhAAACIAEmaXEAAAIgISZpQQBAAiABJqlRAEACICEmqWEAQAIgASbpcQBAAiAhJulBAIACIAEnKVEAgAIgIScpYQCAAiABJ2lxAIACICEnaUEAwAIgASepUQDAAiAhJ6lhAMACIAEn6XEAwAIgISfhgRQAJsEAAAXQACApQQEAAiAhKClRAQACIAEoaWEBAAIgIShHwCAAEQAAAAEBAAAADAuNQAEFAAAAE5lbydzIExpdHRsZSBIZWxwZXIABA8AAAByYXcuZ2l0aHViLmNvbQAELwAAAC9mcm5lby9Cb0wvbWFzdGVyL1NjcmlwdHMvTmVvc0xpdHRsZUhlbHBlci5sdWEABAcAAAA/cmFuZD0ABAUAAABtYXRoAAQHAAAAcmFuZG9tAAMAAAAAAADwPwMAAAAAAIjDQAQMAAAAU0NSSVBUX1BBVEgABA4AAABHZXRDdXJyZW50RW52AAQKAAAARklMRV9OQU1FAAQJAAAAaHR0cHM6Ly8ABA8AAABBdXRvdXBkYXRlck1zZwAECwAAAEF1dG9VcGRhdGUAAwAAAAAAAAAABAMAAABfUQAEAwAAAF9XAAQDAAAAX0UABAMAAABfUgAECwAAAFNVTU1PTkVSXzEABAsAAABTVU1NT05FUl8yAAQGAAAAQ05hbWUABAYAAABmbGFzaAAEBQAAAE5hbWUABA4AAABTdW1tb25lckZsYXNoAAQGAAAAZ2hvc3QABA4AAABTdW1tb25lckhhc3RlAAQHAAAAaWduaXRlAAQMAAAAU3VtbW9uZXJEb3QABAgAAABiYXJyaWVyAAQQAAAAU3VtbW9uZXJCYXJyaWVyAAQGAAAAc21pdGUABA4AAABTdW1tb25lclNtaXRlAAQIAAAAZXhoYXVzdAAEEAAAAFN1bW1vbmVyRXhoYXVzdAAEBQAAAGhlYWwABA0AAABTdW1tb25lckhlYWwABAkAAAB0ZWxlcG9ydAAEEQAAAFN1bW1vbmVyVGVsZXBvcnQABAgAAABjbGVhbnNlAAQOAAAAU3VtbW9uZXJCb29zdAAECAAAAGNsYXJpdHkABA0AAABTdW1tb25lck1hbmEABAYAAABjbGFpcgAEFQAAAFN1bW1vbmVyQ2xhaXJ2b3lhbmNlAAQHAAAAcmV2aXZlAAQPAAAAU3VtbW9uZXJSZXZpdmUABAkAAABnYXJyaXNvbgAEFQAAAFN1bW1vbmVyT2RpbkdhcnJpc29uAAQHAAAAT25Mb2FkAAQJAAAATG9hZE1lbnUABAUAAABJbml0AAQMAAAATG9hZEVuZW1pZXMABA8AAABEcmF3U2tpbGxMZXZlbAAECwAAAEdldEJhckRhdGEABAwAAABEcmF3RW5lbWllcwAEDAAAAERyYXdGcmllbmRzAAQHAAAAT25EcmF3AAQMAAAAR2V0SFBCYXJQb3MABAcAAABPblRpY2sABAsAAABGaW5kU3ByaXRlAAQJAAAAT25VbmxvYWQABAsAAABXYXJuUmVjYWxsAAQJAAAAVklQX1VTRVIABA0AAABPblJlY3ZQYWNrZXQABA8AAABEdW1wUGFja2V0RGF0YQAECwAAAER1bXBQYWNrZXQAEwAAAC8AAAAvAAAAAQAHCQAAAEYAQACBQAAAxQCAAAGBAABAAQAAgcEAAJaAAQFdQAABHwCAAAQAAAAEBgAAAHByaW50AAQaAAAAPGZvbnQgY29sb3I9IiM2Njk5ZmYiPjxiPgAEJAAAADo8L2I+PC9mb250PiA8Zm9udCBjb2xvcj0iI0ZGRkZGRiI+AAQJAAAALjwvZm9udD4AAAAAAAIAAAAAAAECAAAAAAAAAAAAAAAAAAAAADAAAABEAAAAAAAGPAAAAAUAAAAbAAAAF8ANgAYAwABFAAABhQCAAR2AgAEbAAAAF4ALgEZA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"), nil, "bt", _ENV))()