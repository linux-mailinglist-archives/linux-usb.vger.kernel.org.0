Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02C23E2E14
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 17:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245085AbhHFP56 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 6 Aug 2021 11:57:58 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46895 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241405AbhHFP56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Aug 2021 11:57:58 -0400
Received: from [192.168.1.107] ([37.4.249.97]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MD9CZ-1mKanQ2jQn-009Cv6; Fri, 06 Aug 2021 17:57:29 +0200
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>
References: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
 <44d8f7e0-b2d0-8547-7367-7a35af68efe6@i2se.com>
 <7c2e3e1f-db10-b376-9b87-ef93c8d8289c@ivitera.com>
 <f9c90203-a67e-0e33-09a8-f173af63e771@i2se.com>
 <a5b12552-1340-aa71-caca-fbef98b8b3e3@ivitera.com>
 <b95c479a-43bc-b9bc-1e83-cf2fab2fbd95@ivitera.com>
 <76d98dbe-61b3-148e-e9d6-ceba1db600d6@i2se.com>
 <791c432f-fd65-870f-3167-6b2056d6d5bd@ivitera.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdudVBHIHYy
 CgptUUlOQkZ0NmdCTUJFQUN1Yi9wQmV2SHhidkplZnlaRzMySklObW4yYnNFUFgyNVY2ZmVq
 bXlZd21DR0tqRnRMCi9Eb1VNRVZIRHhDSjQ3Qk1YbzM0NGZIVjFDM0FudWRnTjFCZWhMb0J0
 TEh4bW5lQ3pnSDNLY1B0V1c3cHRqNEcKdEp2OUNRRFp5MjdTS29FUHh5YUk4Q0YweWdSeEpj
 NzJNOUk5d21zUFo1YlVIc0x1WVdNcVE3SmNSbVBzNkQ4ZwpCa2srOC95bmdFeU5FeHd4SnBS
 MXlsajVianhXREh5WVF2dUo1THpaS3VPOUxCM2xYVnNjNGJxWEVqYzZWRnVaCkZDQ2svc3lp
 by9ZaHNlOE4rUXN4N01RYWd6NHdLVWtRUWJmWGcxVnFrVG5BaXZYczQyVm5Ja211NWd6SXcv
 MHQKUkp2NTBGUmhIaHhweUtBSThCOG5oTjhRdng3TVZrUGM1dkRmZDN1R1lXNDdKUGhWUUJj
 VXdKd05rLzQ5RjllQQp2ZzJtdE1QRm5GT1JrV1VSdlArRzZGSmZtNitDdk92N1lmUDF1ZXdB
 aTRsbitKTzFnK2dqVklXbC9XSnB5MG5UCmlwZGZlSDlkSGtnU2lmUXVuWWN1Y2lzTXlvUmJG
 OTU1dENna0VZOUVNRWRZMXQ4aUdEaUNnWDZzNTBMSGJpM2sKNDUzdWFjcHhmUVhTYUF3UGtz
 bDhNa0NPc3YyZUVyNElOQ0hZUUR5WmljbEJ1dUNnOEVOYlI2QUdWdFpTUGNRYgplbnpTektS
 Wm9POUNhcUlEK2ZhdkxpQi9kaHptSEErOWJnSWhtWGZ2WFJMRFp6ZThwbzFkeXQzRTFzaFhp
 ZGRaClBBOE51SlZ6RUl0MmxtSTZWOHBaRHBuMjIxcmZLaml2UlFpYW9zNTRUZ1pqak1ZSTdu
 bko3ZTZ4endBUkFRQUIKdENCVGRHVm1ZVzRnVjJGb2NtVnVJRHgzWVdoeVpXNXpkRUJuYlhn
 dWJtVjBQb2tDTndRVEFRZ0FJUVVDWElkYwo0Z0liQXdVTENRZ0hBZ1lWQ0FrS0N3SUVGZ0lE
 QVFJZUFRSVhnQUFLQ1JDVWdld1BFWkR5MjFPVEQvOUdpWkxkCnRSWWNteVJKZ2x0aVFRekFp
 UWRjSUQ3OGxHb1dwL3grci92Y1U2YjZqdVl1ZVR3Z1Iwclc3djdsMklSQnlEN24KSEp4YSt0
 SVNvUVpCZ2hvbE1JZmI5TXRoR09KTENZNzdrL1FoQWhuMzJOR1prZWp3OXR6a3MvNDBtclpT
 VVQ4NApaeWJzUVhyTE0vSFI2VElJL0RlUEIwbktEM0ppcHBzMlVIUUQ5cUQySWpFd1NRUGxI
 akNPckVaaDQ1UFo3bTkrClo5M0x6aVRlc1dabFlRdUxpSndzNHJLcHRIVzFkL3dSZWxzaG1t
 NlFxY0wybDRDL2U0MGVEQjlncTRkU1poOVgKUEVZbGxpeU5RaDdhMkxTZHVtRTFyK2NTd0lq
 RS91ZHRSdmRPOWFLb0psT2JVSzVkTmpTUEg3d0tUYndkWGRZRApHUHdEaFhkNThOQXdyK1BY
 QmxQajB0STFMQ3ErTEJ4ZUt6aFdYK0dWcTlEb2pWanlVREV4Rk5Ga1h1b0M3ZzhtClY5VDB0
 ZUJpdVpSbm91WEt3VjJGcHRaT0hIN0JVRVd0a0t0aGgxZXRmT1dwaWdCemtVN2JQc2ZJWVQr
 cnk5dGIKMW9KK3Y0MVBOYXFaRW1QVXBKeHZmek5UN3Ayd01lRDdaajlmMHJ1YlJQdExBSjJR
 R2pyRkhzdVh3QU9xcHl6ZQoxOEVidHNZazBOMHp1SEVoY2orUEJJQmZoMFlJWWQ1MW9mNkdJ
 aU95UjlxMFhYdHBsVUo3VDIvSDF1UXFrWGxwCitnVzRWa2lmc2NJckl1eWZueFpXMTJlSXZq
 NnlicVdMN2FZS0dZbVQ2aUxDUGJIWXlZY2F5bDRFa0ZjckNGN0UKZTBXVC9zY1ZNaE8vNVgv
 SGFOQTVIQngvcjUycGdMY3Y0aTlNeExRbVUzUmxabUZ1SUZkaGFISmxiaUE4YzNSbApabUZ1
 TG5kaGFISmxia0JwTW5ObExtTnZiVDZKQWpnRUV3RUNBQ0lGQWx0NmdCTUNHd01HQ3drSUJ3
 TUNCaFVJCkFna0tDd1FXQWdNQkFoNEJBaGVBQUFvSkVKU0I3QThSa1BMYmpic1AvamdqYVNz
 NUh0bGtBSXZXUytGcm15N2MKaG5jT0F4TFRWL0Q2UkV3SU95R0poRkt3d29pck55UTJnOXZV
 YTNZQ1lDZjFmSjh3RWhhS09COWQwTHBNUm5MNApkRVQ4ZDgyMzhFL3BLK0hxTktpSXNKaHM2
 SnNLOFpnalZRR3JtbWZua0dyWisxdjBIQnV4ZGljZ0duUC9XdHVBClVsOGw2Mi9BTGJheXlq
 KzYxQ2xyc0V0UklhcU82N0xJWXdQaVBEUkkrWGlNek5pR3pIRi8xUTZHUjAyUkg2YTMKRjg5
 ejhhUHhjSGkxWnZDdDJ5a3o2VUVjaHpQMHI1Z3FGSisvTC9VcHU4ME1YaVk0djVlSWFCNTJn
 VlBnaXlNQQpsTDJkRHMxbUladm5yUkxSWTJ0YjNtQVlOa1Y1QjVJRFQzcGtXeTZrS281T0Nn
 SytZZFlPUjhGTloyb04ydDhPCnJLK1ZudGFLN01NU0tIbG1ZL3NPd3RSbEVoMU9CbXJjQ3dH
 d21wLzA1R2tSNDZmL0lzaFJWZUZPUmF3K0dBcXQKUDIrQ0ZhMkNOQS9JSG5aTm95aWtsRHpQ
 UUhVVUdzck5wcERyaFg5Sm1oQm1nMXYyeXdIMU5YdTFpRGZQMUJBdwpLZ29rdDVmNVVhUkY5
 c0FBNTN2V0V2YlVVTjllZXNGR0x6UFdkSkdRNWhwZC9WSDVJUXk5U0JyaC93SWNla3E1Cm4w
 a042cGJUSHhHRTUyU2kvTVZJa05UdURaM2FwbjJqbERaNHBPdHBCWEkydlAzYlBPK05pcUJa
 anNVM3R4TGkKV2R2MkZqeXp6NlhMUndlV1JZVkw1SGE2TER0eG9yMnZ1NlVQMDdwOXh6MXhS
 WmFPRFczb1lsSEZ6WXBhNFc1ZwpMSGIybEVrSXVVZlNjaWNHYmpqQXRDbFRkR1ZtWVc0Z1Yy
 Rm9jbVZ1SUR4emRHVm1ZVzR1ZDJGb2NtVnVRR2x1CkxYUmxZMmd1WTI5dFBva0NOd1FUQVFn
 QUlRVUNYSWRlaHdJYkF3VUxDUWdIQWdZVkNBa0tDd0lFRmdJREFRSWUKQVFJWGdBQUtDUkNV
 Z2V3UEVaRHkyeUhURC85VUY3UWxEa0d4elE3QWFDSTZOOTVpUWY4LzFvU1VhRE51Mlk2SQpL
 K0R6UXBiMVRiVE9yM1ZKd3dZOGEzT1d6NU5MU09MTVdlVnh0K29zTW1sUUlHdWJEM09EWko4
 aXpQbEcvSnJOCnQ1elNkbU41SUE1ZjNlc1dXUVZLdmdoWkFnVERxZHB2K1pIVzJFbXhuQUox
 dUxGWFhlUWQzVVpjQzVyMy9nL3YKU2FNbzl4ZWszSjVtTnVEbTcxbEVXc0FzL0JBY0ZjK3lu
 TGh4d0JXQld3c3Z3UjhiSHRKNURPTVd2YUt1RHNrcApJR0ZVZS9LYjJCK2pyYXZRM1RuNnMv
 SHFKTTBjZXhTSHo1cGUrMHNHdlArdDlKNzIzNEJGUXdlRkV4cmlleThVCkl4T3I0WEFiYWFi
 U3J5WW5VL3pWSDlVMWkyQUlRWk1XSkFldkN2VmdRL1UrTmVSaFh1ZGU5WVVtRE1EbzJzQjIK
 VkFGRUFxaUYyUVVIUEEybThhN0VPM3lmTDRyTWswaUh6TElLdmg2L3JIOFFDWThpM1h4VE5M
 OWlDTHpCV3UvTgpPbkNBYlMremx2TFphaVNNaDVFZnV4VHR2NFBsVmRFamY2MlArWkhJRDE2
 Z1VEd0VtYXpMQU1yeDY2NmpINWt1ClVDVFZ5bWJMMFR2Qis2TDZBUmw4QU55TTRBRG1rV2tw
 eU0yMmtDdUlTWUFFZlFSM3VXWFo5WWd4YVBNcWJWK3cKQnJoSmc0SGFONkM2eFRxR3YzcjRC
 MmFxYjc3L0NWb1JKMVo5Y3BIQ3dpT3pJYUFtdnl6UFU2TXhDRFhaOEZnWQpsVDR2MjNHNWlt
 SlAyemdYNXMrRjZBQ1VKOVVRUEQwdVRmK0o5RGEycitza2gvc1dPbloreWNvSE5CUXZvY1pF
 Ck5BSFFmN2tDRFFSYmVvQVRBUkFBMkhkMGZzRFZLNzJSTFNESGJ5ME9oZ0RjRGxWQk0yTSto
 WVlwTzNmWDFyKysKc2hpcVBLQ0hWQXNRNWJ4ZTdIbUppbUhhNEtLWXMya3YvbWx0L0NhdUNK
 Ly9wbWN5Y0JNN0d2d25Lem11WHp1QQpHbVZUWkM2V1I1TGtha0ZydEhPelZtc0VHcE52NVJj
 OWw2SFlGcExrYlNrVmk1U1BRWkp5K0VNZ01DRmdqclpmClZGNnlvdHdFMWFmN0hOdE1oTlBh
 TEROMW9VS0Y1aitSeVJnNWl3SnVDRGtuSGp3QlFWNHBndzIvNXZTOEE3WlEKdjJNYlcvVExF
 eXBLWGlmNzhJaGdBelh0RTJYck0xbi9vNlpINzFvUkZGS096NDJsRmR6ZHJTWDBZc3FYZ0hD
 WAo1Z0l0TGZxemoxcHNNYTlvMWVpTlRFbTFkVlFyVHFueXMwbDE4b2FsUk5zd1lsUW1uWUJ3
 cHdDa2FUSExNSHdLCmZHQmJvNWRMUEVzaHRWb3dJNm5zZ3FMVHlRSG1xSFlxVVpZSXBpZ21t
 QzNTd0JXWTFWNmZmVUVta3FwQUFDRW4KTDQvZ1Vnbjd5US81ZDBzZXFuQXEycFNCSE1VVW9D
 Y1R6RVFVV1ZraUR2M1JrN2hURm1oVHNNcTc4eHYyWFJzWApNUjZ5UWhTVFBGWkNZRFVFeEVs
 RXNTbzlGV0hXcjZ6SHlZY2M4cURMRnZHOUZQaG1RdVQyczlCbHg2Z0kzMjNHCm5FcTFsd1dQ
 SlZ6UDRqUWtKS0lBWHdGcHYrVzhDV0xxekRXT3ZkbHJEYVRhVk1zY0ZUZUg1VzZVcHJsNjVq
 cUYKUUdNcGNSR0NzOEdDVVcxM0gwSXlPdFF0d1dYQTRueStTTDgxcHZpQW1hU1hVOGxhS2FS
 dTkxVk9WYUY5ZjRzQQpFUUVBQVlrQ0h3UVlBUUlBQ1FVQ1czcUFFd0liREFBS0NSQ1VnZXdQ
 RVpEeTIrb1hELzljSEhSa0JaT2ZrbVNxCjE0U3Z4MDYyUHRVMEtWNDcwVFNucC9qV29ZSm5L
 SXczRzBtWElSZ3J0SDJkUHdwSWdWanNZeVJTVk1LbVNwdDUKWnJEZjlOdFRiTldnazhWb0xl
 WnpZRW8rSjNvUHFGclRNczNhWVl2N2U0K0pLNjk1WW5tUSttT0Q5bmlhOTE1dApyNUFaajk1
 VWZTVGx5VW15aWMxZDhvdnNmMWZQN1hDVVZSRmNSamZOZkRGMW9ML3BEZ01QNUdaMk93YVRl
 am15CkN1SGpNOElSMUNpYXZCcFlEbUJuVFlrN1B0aHk2YXRXdllsMGZ5L0NxYWpUS3N4Nytw
 OXh6aXU4WmZWWCtpS0IKQ2MrSGUrRURFZEdJRGh2TlovSVFIZk9CMlBVWFdHUytzOUZOVHhy
 L0E2bkxHWG5BOVk2dzkzaVBkWUl3eFM3SwpYTG9LSmVlMTBEamx6c1lzUmZsRk9XMFpPaVNp
 aElDWGlRVjF1cU02dHpGRzlndFJjaXVzNVVBdGhXYU8xT3dVClNDUW1mQ09tNGZ2TUlKSUE5
 cnh0b1M2T3FSUWNpRjNjcm1vMHJKQ3ROMmF3WmZnaThYRWlmN2Q2aGp2MEVLTTkKWFpvaUFa
 WVpEKy9pTG01VGFLV042b0dJdGkwVmpKdjhaWk9aT2ZDYjZ2cUZJa0pXK2FPdTRvclRMRk16
 MjhhbwpVM1F5V3BOQzhGRm1kWXNWdWE4czZnTjFOSWE2eTNxYS9aQjhiQS9pa3k1OUFFejRp
 RElScmdVek1FZzhBazdUCmZtMUtpWWVpVHRCRENvMjVCdlhqYnFzeXhrUUQxbmtSbTZGQVZ6
 RXVPUEllOEp1cVcyeEQ5aXhHWXZqVTVoa1IKZ0pwM2dQNWIrY25HM0xQcXF1UTJFNmdvS1VN
 TEFia0NEUVJiZmw5REFSQUFzRExjYStMbFAydm5mdEVHaHBjQQpCR1ZOUUVGbkdQckNhdVU2
 SGhOODA1V3RQVHRtc1JPdUp6cWdVVDBtcHFXSWZacTZzTXd5dkhLOVRzL0tIM0paClVWYlJD
 M3oyaDNLZmhIL0RhZjk1cGQ2bVBjL2g5dkYvT3kzK2VUV2hnR25QNmNBNWtsUitmTzFXaEc4
 VnJpWHYKck5lUkcyMHN6emplSG9jblNJY1Q1WHVaUjB1REhPaUd4T2l6MXNNUkZUR3h6R095
 MTlSOXJ2dTYzdGlJM2Q3dgpnYzc1T0NBZGtlQi9TZUNFbGFSdzBUZjdMWmJQampzRjI2M0JZ
 bk1mNGtrTkVLdnFXY1UyaWNNcCtxZXpqeW5CCnB2ZXVlMHJDVFFCWUFRbG9GQ1ZUR0hyV1dB
 NkQ0VzVPMkFmSWRJYzF1MUpDWnAyZjVMV1ZvVUZUVklyUW5RUVUKU0hDaWZyOU1aeExUdFBK
 ZFU1Mm9TUHczZGs0aExQOGlKSUx1dnYvYXZhakNzUVlIRXR3WXNiZUZaeGl1TGdscApBN1lj
 Sk5ObXBnQ3BNRDR3VWh2bEN0QUtOQlFXeXIyOTc2OThFUVRuNDZlQmVVNkttMkNpaFhrZ3dD
 eWY4ZXlLCkxFM3NYZXdhcTVrZ1pXdk5xNml1NXFZSVJCOXl3K2NYYzYwZE9aRE9scTkzWDVT
 QVJZemFvZXBrSHo0cmtMa1AKUG8rdENIeUhRUHNHblBYYzlXVDgwREM5Tm5KR2R2VWx5NXJk
 TUk0eHBaeWdlb2tqd293VlFsUFV1Y1M2TXluNwpmOHc4Y2dmQjdDMklBSWNEeDJwUC9IendY
 dmtDT1FOQTdtVjFsTTA4bitnVmtUcnpweGlwNURicTRDSW9ZeDJNCkpaVDhiR1JINlhqY1VE
 S2EwOVFoeVpzQUVRRUFBWWtFUkFRWUFRZ0FEd1VDVzM1ZlF3SWJBZ1VKQThKbkFBSXAKQ1JD
 VWdld1BFWkR5MjhGZElBUVpBUWdBQmdVQ1czNWZRd0FLQ1JCVnhETFBjVk1NamNkc0QvMFJo
 QXN1UVlPeQpyMTNCbDNOaFhrWUFaR3AyWkZER3VrZTdPU2tWOG9qT09UZFR5ei9jT1JHQ2J5
 ZEQrRGd2cUZ5VmRuT1hLZ08wCmxKbUd3ckdlTGRnZ0F2aDBpaHJwNU8wWVVKOWJCU1htR01t
 UVRZSC9BbUxUR2FkYnVqQ1dqNWZGVWtDeXd4aW0KSHV5MFBiMjRwelR2UzUwR1k1WStxSDBG
 SE5haWdka2tpV04zcnVnN0haRXUvQ3lsUFpqT1h6K0QxUVBNckV4dwo3ZC9NS2FiVis5YU5i
 UVlabGRJajk4UXd2VUYxS1N6YThqbFVJdnBoUnEyN0FUOGZER1lHUGZERU1nMmNCT2FlCkty
 N29uUXM0YjdhV082aWZEbHhRVHB6c3pvK0FuODA3Tk1TdFZFRmYrczNBaFZEM2U3bmY4SkJh
 dmJWckFlMGsKb20yNm96elBubnh6K2xxVlZ0dzZVazRYTUl6dGl4L0h3SFl3dUNuY1VYWndL
 MEkzeUFKd2pZd29vck9DaEozUwpFVWJKUVB0R3NneFJERXhWQkZlNk5MUC82MnhQOU82dGFj
 d09kYjBNbVAxYjM5cFJBVEM3YmdkMWxkVUxpNzVaCmxKckowL1NpVkVyb3FOWXk3OXRmbWdB
 WjJVeFptczlTckV5Nm85UVNmc24xYVh2K01QTDlKYUNHbWtQNnpiTFEKTm5kajBKY2FRbmtD
 MHZneWRPMUJtNk11OTZQOXVmbEtaY0FTNndtTE01SWRIT3lqTDg4d0h3anVjakFPQnRjdwpw
 MG9HVG5WT25Sc05ZU084VzhZWi9LZGJ1Nzg1ZGF6TXFKMmlOakFEdUJiZG02TjRqNUVkTW5r
 TG4wQklmUEpwCmRnbTR2bDJVcExqd1JHci9NM3dtbTVwdnMrNnVCN2hrL0ZKaUQvNGxsRU5Q
 NGVNMWg3U200aitWcTZOMSt6VEIKSVhKQWViSXFhc0RwNXlaUzdYcnk0STM2bjg1WEVZZkcw
 MWx0QXlob05WMkRPOFNJUlFwdWkydHErOVJQM1JLMQpKREJ4eEVKWTJFTzVKWjhNeGFQSFEw
 RFQwNWxSRmpLMkFsaGRFSXRqTGpwSjNmVW05c3FMeE1XeHpQNlV6M2lpCjJ1YTR1bnJ0Nk9D
 VHFRd2lqRi8zYlRXaXd2VkFBSG5NRlVpb1hzaEhhb2hWRGNWZm5lSU1mVjBiUUNYWWkzTnAK
 WTB2MFp3Y2lGSCtnU0M3cUQ2WE51aHBWR1NMNElpbGlGeS9TemNhSkV6QUhlTERTaFpQMkNX
 ZG5DNHZnbDM3dApocHg4aDU1WWhKbjZIU3VVelBnaGFLdFZCMmsrajdaZXlaK1NGeHA3SXVi
 SEN3TEhsUWhUNzVSd1EzaUF4S242CjBxajUxY1lUbnF4ZFpYVzZmSDNQa3VNellVNUdwcVIv
 MU9sNWMvd2ZJNmc2QW04eUtXLzBFVUx0K0tuNExGc1MKbTdZM201SDV2MTJVNkpCWXZWK3Ix
 M2paaW9zNEVFREU5M0Q1c05IMk1JeVJ6Q0RxMXpkZHQ0WHV5S0ZqUEtXMQo5aWJaRGZGVjdL
 dUNzdnVMMjNzQmMxc0NNb3ArRTFtVC9ReE9JQTZvRFQxTVFzdHdPVnVReURDdi9PdktTZ2Z6
 CjhGWEdMNkFQY2xqQ3FqOEFKaHhReXN4ZG9pUVA4bS92dStialdHR3Z4dzVzMWxncGlSRFRS
 VVBnY0pKTmFHWTIKVklEclpRaTROU2lOUTBOSWkrZGp1NGZOTW1DcFFxZzh0YkMzY0FhNnl3
 bTZvUUIxU0JobURYMmUxMWdSbGx1SQpPblRHUEUwSFRvM2w3MmxoYmc9PQo9cVpNVgotLS0t
 LUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
Message-ID: <e2229e30-7fdf-5894-6036-e0b233d22981@i2se.com>
Date:   Fri, 6 Aug 2021 17:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <791c432f-fd65-870f-3167-6b2056d6d5bd@ivitera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Provags-ID: V03:K1:I05xjPHNCeRHX+x7lZ25H9AwcDZmr87Io5+B8V7qUJAu67R8VqX
 MkNlLrEojJomPs7dh2v4YjuNwePNDCpzsoLSh86X03lfDa/oXeEnG6O08ZzyzGS4iuHdt7i
 O/TSZof8cfHGdi80h15ZCn6GLhm0OmmE9koHdft/KwZ03CVCiPhOl2+BMAD7uRMcqnhZjxC
 dzdPS5hwnAdbeUCbvdadA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n2ZjDG4N110=:YGSCuU8CTSYGnMzIiMelFR
 pIqyisIoAPp/128G9spSdmcLb/h74ZUWxCq1y6ye0J6mH7m/YcSEW7oEALAkfWS8EZT3GdAIM
 yvxTMbSyPQVyay6zEuvB0UAczBiXB5g+zbtgAnHJsdj8GjIzhEiJ4T+h5j2ocCtZvLVD2rQik
 jTDUkZiwIx1QsLAO9O9XOd/Wd6RlsGhY+uQ/KKKvr6i5bhKuanVP9d3RgsyoULGUBf9pVBCJq
 eGnCjadXWyfhjNehmrADzomA3dAtJvSZfyGGWY2YLUW6OYYfQpMA9zugzia78lyFEA1NsV6tE
 56+SugkH7FmD9KZa1TWzXQtxwC3nXkWYGmsGrUIm9lZorUcBc+HteYE7VUW15Me/j7n8jBrFo
 pKoBqtkR1dLq/Wzi2H4S3IOoGSvc98j8tjvdAB2UfWyvJGha1D4G95OR0Hn7Ch6XAEQHQDWBr
 KowfLCkYhc96wB9/IpwvM4JompcVqUuYXATiZwEylplpCzfnp8vnZ2JHiZ+rvTY9teJLqXqYh
 ACsV9Jjod5EbAt1y89Jq0ro7+Pr59TyX0fqSt9yS4NJsVf0QwwjTXeNMFk4KqWoPZzIklGzJv
 GeVT7vOvLc3GP7xCgh1G6pocVmnz1io8XvdhbiHO9ZSKyzPEr9Vv4pFDwI294KB8QINfspydz
 KMYAEx06E0+licSQMm8yxvxuuOldwsR2MUPav+r3zCYtMAJ7bFt6AGrZ7UtLyENIfmOtH6EbQ
 HNT9dKjKUv1xftA8kHdaDqbF4XB32U4/YKvJIZSWWQ8St5ySTcKrtmjnVhabctGDCMjPpdV2N
 BekeI3+pxJj2xXkDgOGlohQt/4tE/BpmhE1w5xIBSJkn5t1ke1A7oMuYHVMijslvnNSFVibSN
 DT9kY/Ugnhph/6cRo1ceghZuDRaOn4mRmsAWUh37tDrVKPA/qeuuFuey9MXg58
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

Am 06.08.21 um 16:46 schrieb Pavel Hofman:
> Hi Stefan,
>
> Dne 06. 08. 21 v 16:08 Stefan Wahren napsal(a):
>> Hi Pavel,
>>
>> Am 06.08.21 um 15:03 schrieb Pavel Hofman:
>>> Dne 28. 05. 21 v 10:59 Pavel Hofman napsal(a):
>>>> Dne 27. 05. 21 v 15:47 Stefan Wahren napsal(a):
>>>>
>>>>>> I think I see the problem.
>>>>>>
>>>>>> IIUC the calculations and checks, all g-tx-fifo-size values +
>>>>>> g-rx-fifo-size + g-np-tx-fifo-size must not exceed
>>>>>> total_fifo_size. My
>>>>>> RPi4 reports the total_fifo_size as 4080 (in
>>>>>> /sys/kernel/debug/usb/fe980000.usb/hw_params).
>>>>>>
>>>>>> Linux mainline
>>>>>> https://github.com/torvalds/linux/search?p=3&q=g-tx-fifo-size :
>>>>>>
>>>>>> The increase in value of g-rx-fifo-size exceeds the limit for the
>>>>>> DTSI
>>>>>> files we patched:
>>>>>>
>>>>>> Both bcm283x-rpi-usb-peripheral.dtsi and bcm283x-rpi-usb-otg.dtsi:
>>>>>> 558 + 32 + 256 + 256 + 512 + 512 + 512 + 768 + 768 = 4174 > 4080
>>>>>>
>>>>>> while the sum with the previous value of 256 reached just 3872 <
>>>>>> 4080.
>>>>>>
>>>>>>
>>>>>> The raspberrypi repo
>>>>>> https://github.com/raspberrypi/linux/search?q=g-tx-fifo-size :
>>>>>>
>>>>>> It has a different mix of the DTSI files
>>>>>> dwc2-overlay.dts
>>>>>> upstream-overlay.dts
>>>>>> upstream-pi4-overlay.dts
>>>>> yes these overlay files are vendor specific and doesn't exist in
>>>>> mainline. The upstream*dts were intended to "simulate" mainline
>>>>> behavior, but unfortunately differ in this case.
>>>>>>
>>>>>> all of which define
>>>>>> g-tx-fifo-size = <512 512 512 512 512 256 256>;
>>>>>>
>>>>>> Here the calculation holds:
>>>>>> 558 + 32 + 512 + 512 + 512 + 512 + 512 + 256 + 256 = 3662 < 4080
>>>>>>
>>>>>> My RPi4 uses one of these DTSIs, because my
>>>>>> /sys/kernel/debug/usb/fe980000.usb/params says:
>>>>>>
>>>>>> g_rx_fifo_size                : 558
>>>>>> g_np_tx_fifo_size             : 32
>>>>>> g_tx_fifo_size[0]             : 0
>>>>>> g_tx_fifo_size[1]             : 512
>>>>>> g_tx_fifo_size[2]             : 512
>>>>>> g_tx_fifo_size[3]             : 512
>>>>>> g_tx_fifo_size[4]             : 512
>>>>>> g_tx_fifo_size[5]             : 512
>>>>>> g_tx_fifo_size[6]             : 256
>>>>>> g_tx_fifo_size[7]             : 256
>>>>>>
>>>>>>
>>>>>> IIUC the tx_fifo values in bcm283x-rpi-usb-peripheral.dtsi and
>>>>>> bcm283x-rpi-usb-otg.dtsi files can be lowered to the values used and
>>>>>> tested (at least by me) in the RPi repo. But this is outside of my
>>>>>> knowledge, honestly I do not know what is the most appropriate
>>>>>> distribution of the remaining fifo space among the g_tx_fifo
>>>>>> buffers.
>>>>>> Please can the RPi developers (Phil?) suggest a fix?
>>>>>
>>>>> As author of the mainline bcm283x-rpi-usb-otg.dtsi i was trying to
>>>>> optimize the fifo sizes for EP 6 and 7. But i don't remember why.
>>>>> So my
>>>>> suggestion for a fix would be:
>>>>>
>>>>> g-tx-fifo-size = <256 256 256 512 512 768 768>;
>>>>>
>>>>> But i'm also unsure about the values.
>>>>>
>>>>
>>>> IIUC this code
>>>> https://github.com/torvalds/linux/blob/master/drivers/usb/dwc2/gadget.c#L4091
>>>>
>>>>
>>>> optimizes the FIFO assignment to endpoints. From that I would conclude
>>>> that correct values are specific for each use-case configuration of
>>>> endpoints. Maybe a varied selection (256, 512, 768) is more convenient
>>>> than just 256 and 512. I really do not know what use cases need
>>>> what TX
>>>> fifo values.
>>>>
>>>
>>> My patch raising  g-rx-fifo-size = 558 has been reverted back to
>>> g-rx-fifo-size = 256 in upstream. 256 is clearly a wrong value. 558 is
>>> enough for 2 packets per microframe. How about raising the value in
>>> the mainline DTS files to 301 instead which will correctly work with 1
>>> packet per microframe (the most common scenario) and comply with the
>>> 4080 limit of the RX + all TXs sum of the TX configs in the mainline?
>>
>> thank for your feedback. It has been reverted because the last patch
>> broke USB completely on Raspberry Pi Zero and the only explanation for
>> me is it has never been tested. The workflow is that the submitter is
>> responsibly for testing. In case this is not possible the patch must be
>> tagged with RFT or at least it must be mentioned in the commit message.
>>
>> In case you want to have a different value, please feel free to send a
>> patch, but please test it against a mainline kernel before. In case you
>> have problems with it, feel free to ask.
>>
>> Sorry, in case this sounds grumpy but it's very annoying to hunt down
>> especially avoidable regressions with every kernel release. This wastes
>> other developers time to get their patches upstream.
>>
>
> I understand your points. I really did not test the patch with
> mainline combination of the TX values, sorry for that. I have no
> problem with the revert at all, just pointing out that the value of
> 256 is incorrect. It took a number of hours with patient help of Minas
> to find the culprit of the dwc2 gadget dropping audio samples with
> packet sizes over 980 bytes.
believe me, i understand this absolutely as the author of the mainline
Raspberry Pi Zero DTS (back in 2017). In the old days there were a lot
of issues in the DWC2. It took until ~ 4.14 to get a proper working USB
host mode.
>
> However, even if I did test and changed the TX values on my RPi4
> accordingly, I would not have been able to test on RPi Zero and the
> other RPi models. 
This doesn't matter. The USB IP is always the same. The mentioned issue
was also on the Raspberry Pi 4, but nobody notices this (using Raspberry
Pi 4 as USB gadget is very special). But for the RPI Zero this issue was
very critical.
> The questions are:
>
> * Why did your TX values, changed to comply with the 4080 limit, break
> RPi Zero, what are the rules apart of the max sum of 4080?
Unfortunately i don't have access to the DWC2 reference manual and the
time to figure out all these constrains.
>
> * Why does mainline config have different RX and TX sizes than the
> RPi-vendor specific config (which I happen/ed to use)?

For my initial version of the DTS i took some working values, i don't
remember exactly. During time the values in the vendor tree changed.
Nobody upstreamed the later changes.

I'm fine with changing all to RPi-vendor specific settings, as long as
it works with OTG, Gadget mode, with and without USB hub, ...

I don't have a strong opinion for these magic numbers. Currently i'm
busy in my spare time with CM4 upstreaming, so not much time for this topic.

I hope this helps.

Best regards
Stefan

>
> Maybe these questions should be resolved, allowing for safer
> developing the gadget on the RPi hardware.
>
> Best regards,
>
> Pavel.

