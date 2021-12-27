Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8FB47FCA8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Dec 2021 13:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbhL0MfG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Dec 2021 07:35:06 -0500
Received: from mail-vi1eur05olkn2054.outbound.protection.outlook.com ([40.92.90.54]:16929
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233750AbhL0MfE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Dec 2021 07:35:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVBbfhym6RQHttjdi0US0qxY5h+V5zz5EuItvlgC7rY7sBtuYL+Guc8GizsZFp20XVzXKKQEIz9RBzbiOPchsDEa8dV8XM0notUKp4X6N/WKDZNTn/pdEmQb0XE8040/2+/GxFuZgHf7GtP+uffNBwuKu0Wjhnw/HQxa8Z7KC5Y/vKA6Q4KMbkvSNFWodxgxecVbrY6/fSlmGb+c3jaTxgm0kMmDkB5zey+8wvbNzZwwUXPQyyOVIm9O1MgTHLT2/V5hRKHzpHreK5MGuwgtAS2z+GexdCdYKVQYbzptD346q9OoPNQRlRJo6lTYbWpFFo4L6arF9K6zvQP7nwOizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnhuEP6nI5YIsjiP4DsitAPAWyVQBaI1rha/Y/ieeno=;
 b=OfykyXH5xaqQrDDHywg0eI+pVpdYPOcab+JYhHgEpQ8i5PvnluK1JqV6m8iPJxFpXlUgR0qIk7MQqrD0YJANAuiiOrJJWftvbz7i7QnliuNBMYkV6Xx13kmDl4xMkg+U2ku1VRaHdi14ZiV0C50lWtpT2QBPekLXjXwhdjkUOjARwK0zMIbc3IiEErD9pr5t0vTgnjnzqtn/t4b+TXprlWtzLmJbfOX+f8zrDTUw35H8gWfN+kBggWUNPwGRwaP45GsyQA9nWM90CB2yNC9q0orV9MWMfuvquRhlerlyc0YifoPczRiT4dUyHd7dfCVWslWYGqDsxpn0hUgxQX9hYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM0P189MB0705.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19b::15)
 by AM0P189MB0625.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:193::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 12:35:01 +0000
Received: from AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 ([fe80::1065:d9ab:734f:1947]) by AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 ([fe80::1065:d9ab:734f:1947%8]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 12:35:01 +0000
Message-ID: <AM0P189MB07058D1932CF2B3757E535A69F429@AM0P189MB0705.EURP189.PROD.OUTLOOK.COM>
Date:   Mon, 27 Dec 2021 13:35:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] usb: hub: avoid warm port reset during USB3 disconnect
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>, sr@denx.de
References: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
From:   "Wohl, Tobias" <wohl.tobias@hotmail.de>
In-Reply-To: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN:  [GODKYgnCOGfYZjqXoxQN3elUOOtunJda]
X-ClientProxiedBy: AM6P194CA0011.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::24) To AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:208:19b::15)
X-Microsoft-Original-Message-ID: <3f4ebc9c-3612-d08a-63d2-a4059245b7c6@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1a25eb6-dd9b-4c71-9c2f-08d9c9354d06
X-MS-TrafficTypeDiagnostic: AM0P189MB0625:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jO7KX/oNwtZsRvVcaq/t6YHdjez3TR+ZjNZ0oITWZKh1/xHJIoDJ4YdUnJC/EtWMrBtjStINZAuvA6bKXN/D+RQ884w3MDLJ9Dxrtvs1us+vU5E7++mYACSm0BZd7CtRYAmjQH6hJiDhVpYP6kr/Jynkh4yHUfhOLJJ7L83ubp8WCe1cG0sznT7VC4cXd+yyYJ0TQI65xVho999Dc0+HZXchsAMnob+HZQmMNoRnTC+c6M4aswippT/R7LwwV8/nlNxZ+Ecyd4RXNGbzdq4dnx7O+tL3eE1EuXAkOQx1/bVfHcMpe513gEDz9leIsA58DmJeU6Ye/TdYDLG5APBtyG8aFv9rXLUcha5yslm0xT4oQ9SbiZY+PIpxvSQwIJJFPPzsl93UmGSrn/llunEtOdFitKBVfFirky8qRE4B8r17x80CIgxKhqRo6Ff8O5Bw6U1Dx3fdCivIO3g29vtTeg+WFy7npaJQISeUGx2YRZuIPgJ6FYpIQDx+0JjMTBtRzDKu5NDCB4CzZoDK0kukIFJ3V0EPPO3embSyeRN69MIX37gOXuZl9kesJQQlyta0n2ujtK1cTqqXskrZtIBqFQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlETXgvZnMzQTJpTDZuNUxYd2dBU2F4bWp3dE1LRmdscnA0VWxrVWttNmIx?=
 =?utf-8?B?QXl3c3hBUkROb3hWSXo5bW8yOHRuOFdWVkFLdFByM1N6MDlSVGdsTXZhQjEw?=
 =?utf-8?B?RGV3OXNWRDIreVJDVXo2QWNXamZnUTdOVlFCTUxpMWpKanV5WFpzSTdjek1T?=
 =?utf-8?B?YnBCbmwvcy94ZElYWlhUcWxmQnh0YUh5eVFxb0hsN0ZQRVVEZTJrNFltUENC?=
 =?utf-8?B?a3lRbERwUURXRStYR2pMSE1jd1cvSW1yOEt0eHFCaWd5dThVRUZQQkJSdG14?=
 =?utf-8?B?U3BhRm9LeEc1ZW9zdTJXdGNWZXkyeFVhWEsvS1haZEF0ZUJYb2tMc1hkRmsw?=
 =?utf-8?B?Mkd0Qks5aXlqUjBKZWhwZjgxcllNTlVRZWxxQVFKL3htZzFaUkM1dFFLSG5Q?=
 =?utf-8?B?QUZBNXlMSitGekVrcExTT0pvZnVUYjhuaXpmcGZoK0puUG1SbWlrVGE5U3ly?=
 =?utf-8?B?RDVaWDR0ZTY1NXArcVhvWWIzSVRtVGwvWFo1VEhDVzZ3anJKM3NFOUkxQmxm?=
 =?utf-8?B?QisvdTZGVmkzVERYT0wyTzZjMHF0end2TTIwenFkeGlpYm4vNjB2ek5GZHhS?=
 =?utf-8?B?cFRmMTF4M3Zyc0YwNG82ZFh2a1p2bHhYT2llb1ZLVUxBQTlBWVB2TUZITGRk?=
 =?utf-8?B?SG5oS2VsL0tLdGkzUmZhU2RrZjlpY0lFQU00RUtMQ3FiRmVXM1FVVnFDbVJ0?=
 =?utf-8?B?TVRldnZ4NU00UUJ4TE5iWlo3NGxHalBDdkFHNWdVREpKaWd4UmlpdkNyTngw?=
 =?utf-8?B?YUNBdHNUMld0L1Btdy9tbGxmY1dudVBrM3BtY2RHbHVxQjJ5S3JHTW5Ka0ZG?=
 =?utf-8?B?VEVuWnhscjdZRE9DRllzYnI2b3BGc0lPemFmcEZtTGZRMUhRRnRsUjVob0Rt?=
 =?utf-8?B?MzlCZ2I1YjFaS0lKYmcwd3BzQi9iNTFxTTNlZGU1azkwcG84dS92VVg2ay8v?=
 =?utf-8?B?NERKM05Dd2RENEF4TkU4eThGOFdjaHZwVnBSYUVucC9RMHVhR2huOVZiSmpJ?=
 =?utf-8?B?c0duTkltREUyYmNrUk5TbTgzNHp6Z2hrKzZYaGNmQ3ExeXZjWE1UUDFCL2hN?=
 =?utf-8?B?QkJYczJsTDJLZitYZ2hsUmZmakdDSXpSeFpKL1RaN0lrOE5BbG53RU0yTUI5?=
 =?utf-8?B?WVlIR3FCcXpDSG5uLzFVMzF4cGpNVlk5NWRmaWtaQy9CTWRkUFB4SWVKSW04?=
 =?utf-8?B?dDlJeEpPTklLUXJqL3plalIwMzd4YXBLek1ZOFo4RFBpSVB5dElFOTd4RnRX?=
 =?utf-8?B?SldnYkh5bGJObjZRSWlLUzFjTlVybDNpK2EzcHd4WlhnK2lmQT09?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a25eb6-dd9b-4c71-9c2f-08d9c9354d06
X-MS-Exchange-CrossTenant-AuthSource: AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 12:35:01.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0625
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

I have encountered the problem that my device (zynq ultrascale+ platform) ends up
performing warm resets when disconnecting USB3 devices and this patch helped with that.
Nevertheless a much higher value for the define DETECT_DISCONNECT_TRIES was needed to detect
the disconnect status early:

[  211.847722] xhci-hcd xhci-hcd.0.auto: Port change event, 2-1, id 2, portsc: 0x4012c1
[  211.847739] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[  211.847767] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
[  211.847786] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x4012c1, return 0x4002c1
[  211.847805] usb usb2-port1: link state change
[  211.847817] xhci-hcd xhci-hcd.0.auto: clear port1 link state change, portsc: 0x12c1
[  211.872383] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  211.872415] usb usb2-port1: Wait for inactive link disconnect detect
[  211.900342] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  211.900372] usb usb2-port1: Wait for inactive link disconnect detect
[  211.928342] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  211.928374] usb usb2-port1: Wait for inactive link disconnect detect
[  211.948323] xhci-hcd xhci-hcd.0.auto: xhci_hub_status_data: stopping port polling.
[  211.956338] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  211.956383] usb usb2-port1: Wait for inactive link disconnect detect
[  211.984345] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  211.984378] usb usb2-port1: Wait for inactive link disconnect detect
[  212.012406] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.012442] usb usb2-port1: Wait for inactive link disconnect detect
[  212.040542] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.040586] usb usb2-port1: Wait for inactive link disconnect detect
[  212.068343] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.068391] usb usb2-port1: Wait for inactive link disconnect detect
[  212.096344] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.096376] usb usb2-port1: Wait for inactive link disconnect detect
[  212.124343] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.124373] usb usb2-port1: Wait for inactive link disconnect detect
[  212.152352] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.152391] usb usb2-port1: Wait for inactive link disconnect detect
[  212.180341] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.180371] usb usb2-port1: Wait for inactive link disconnect detect
[  212.208366] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.208748] usb usb2-port1: Wait for inactive link disconnect detect
[  212.224375] xhci-hcd xhci-hcd.0.auto: Can't queue urb, port error, link inactive
[  212.236342] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12c1, return 0x2c1
[  212.236373] usb usb2-port1: Wait for inactive link disconnect detect
[  212.251650] xhci-hcd xhci-hcd.0.auto: Port change event, 2-1, id 2, portsc: 0x202a0
[  212.251661] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
[  212.264374] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x202a0, return 0x102a0
[  212.264400] usb usb2-port1: Wait for inactive link disconnect detect
[  212.264442] xhci-hcd xhci-hcd.0.auto: Can't queue urb, port error, link inactive
[  212.264451] usb 2-1: Disable of device-initiated U1 failed.
[  212.264477] xhci-hcd xhci-hcd.0.auto: Can't queue urb, port error, link inactive
[  212.264484] usb 2-1: Disable of device-initiated U2 failed.
[  212.264493] xhci-hcd xhci-hcd.0.auto: Set up evaluate context for LPM MEL change.
[  212.264504] xhci-hcd xhci-hcd.0.auto: // Ding dong!
[  212.264529] xhci-hcd xhci-hcd.0.auto: Successful evaluate context command
[  212.264545] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x202a0, return 0x102a0
[  212.264570] xhci-hcd xhci-hcd.0.auto: set port reset, actual port 2-1 status  = 0x202b0
[  212.264599] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
[  212.332342] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a02a0, return 0x3102a0
[  212.332390] usb usb2-port1: not reset yet, waiting 60ms
[  212.400355] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a02a0, return 0x3102a0
[  212.400395] usb usb2-port1: not reset yet, waiting 200ms
[  212.416387] usb 1-1.2-port2: indicator off status 0
[  212.416470] usb 1-1.2-port3: indicator green status 0
[  212.416535] usb 1-1.2-port4: indicator green status 0
[  212.416617] usb 1-1.2-port5: indicator off status 0
[  212.416682] usb 1-1.2-port6: indicator off status 0
[  212.608338] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a02a0, return 0x3102a0
[  212.608376] usb usb2-port1: not reset yet, waiting 200ms
[  212.816348] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a02a0, return 0x3102a0
[  212.816404] usb usb2-port1: not reset yet, waiting 200ms
[  213.024340] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a02a0, return 0x3102a0
[  213.024376] usb usb2-port1: not reset yet, waiting 200ms
[  213.024388] xhci-hcd xhci-hcd.0.auto: clear port1 reset change, portsc: 0xa02a0
[  213.024411] xhci-hcd xhci-hcd.0.auto: clear port1 warm(BH) reset change, portsc: 0x202a0
[  213.024434] xhci-hcd xhci-hcd.0.auto: clear port1 link state change, portsc: 0x202a0
[  213.024456] xhci-hcd xhci-hcd.0.auto: clear port1 connect change, portsc: 0x2a0
[  213.024479] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
[  213.024506] xhci-hcd xhci-hcd.0.auto: CTRL: TypeReq=0x2303 val=0x5 idx=0x301 len=0 ==> -19
[  213.024527] usb usb2-port1: logical disconnect
[  213.024537] xhci-hcd xhci-hcd.0.auto: CTRL: TypeReq=0x2303 val=0x5 idx=0x301 len=0 ==> -19
[  213.024583] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
[  213.024636] usb usb2-port1: status 02a0, change 0000, 5.0 Gb/s
[  213.024645] usb 2-1: USB disconnect, device number 5

In some rare cases even

#define DETECT_DISCONNECT_TRIES 20

was not enough. As I want to make sure that the warm resets will never be performed for
a disconnected device (as this takes a long time), I want to enhance the value for
DETECT_DISCONNECT_TRIES for my application.

Are there any issues to expect when setting a too high value for DETECT_DISCONNECT_TRIES?

Thanks,

Tobias

On 10.12.2021 12:16, Mathias Nyman wrote:

> During disconnect USB-3 ports often go via SS.Inactive link error state
> before the missing terminations are noticed, and link finally goes to
> RxDetect state
>
> Avoid immediately warm-resetting ports in SS.Inactive state.
> Let ports settle for a while and re-read the link status a few times 20ms
> apart to see if the ports transitions out of SS.Inactive.
>
> According to USB 3.x spec 7.5.2, a port in SS.Inactive should
> automatically check for missing far-end receiver termination every
> 12 ms (SSInactiveQuietTimeout)
>
> The futile multiple warm reset retries of a disconnected device takes
> a lot of time, also the resetting of a removed devices has caused cases
> where the reset bit got stuck for a long time on xHCI roothub.
> This lead to issues in detecting new devices connected to the same port
> shortly after.
>
> Tested-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>   drivers/usb/core/hub.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 00070a8a6507..e907dfa0ca6d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2777,6 +2777,8 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>   #define PORT_INIT_TRIES		4
>   #endif	/* CONFIG_USB_FEW_INIT_RETRIES */
>   
> +#define DETECT_DISCONNECT_TRIES 5
> +
>   #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
>   #define HUB_SHORT_RESET_TIME	10
>   #define HUB_BH_RESET_TIME	50
> @@ -5543,6 +5545,7 @@ static void port_event(struct usb_hub *hub, int port1)
>   	struct usb_device *udev = port_dev->child;
>   	struct usb_device *hdev = hub->hdev;
>   	u16 portstatus, portchange;
> +	int i = 0;
>   
>   	connect_change = test_bit(port1, hub->change_bits);
>   	clear_bit(port1, hub->event_bits);
> @@ -5619,17 +5622,27 @@ static void port_event(struct usb_hub *hub, int port1)
>   		connect_change = 1;
>   
>   	/*
> -	 * Warm reset a USB3 protocol port if it's in
> -	 * SS.Inactive state.
> +	 * Avoid trying to recover a USB3 SS.Inactive port with a warm reset if
> +	 * the device was disconnected. A 12ms disconnect detect timer in
> +	 * SS.Inactive state transitions the port to RxDetect automatically.
> +	 * SS.Inactive link error state is common during device disconnect.
>   	 */
> -	if (hub_port_warm_reset_required(hub, port1, portstatus)) {
> -		dev_dbg(&port_dev->dev, "do warm reset\n");
> -		if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
> +	while (hub_port_warm_reset_required(hub, port1, portstatus)) {
> +		if ((i++ < DETECT_DISCONNECT_TRIES) && udev) {
> +			u16 unused;
> +
> +			msleep(20);
> +			hub_port_status(hub, port1, &portstatus, &unused);
> +			dev_dbg(&port_dev->dev, "Wait for inactive link disconnect detect\n");
> +			continue;
> +		} else if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
>   				|| udev->state == USB_STATE_NOTATTACHED) {
> +			dev_dbg(&port_dev->dev, "do warm reset, port only\n");
>   			if (hub_port_reset(hub, port1, NULL,
>   					HUB_BH_RESET_TIME, true) < 0)
>   				hub_port_disable(hub, port1, 1);
>   		} else {
> +			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
>   			usb_unlock_port(port_dev);
>   			usb_lock_device(udev);
>   			usb_reset_device(udev);
> @@ -5637,6 +5650,7 @@ static void port_event(struct usb_hub *hub, int port1)
>   			usb_lock_port(port_dev);
>   			connect_change = 0;
>   		}
> +		break;
>   	}
>   
>   	if (connect_change)
