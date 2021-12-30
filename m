Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95978481D91
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 16:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbhL3PF3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 10:05:29 -0500
Received: from mail-oln040092073022.outbound.protection.outlook.com ([40.92.73.22]:54022
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241193AbhL3PF2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Dec 2021 10:05:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1NrllXqXOs4n2GjCZqQ4w9ilxJsv5CfQf2Lmvoscyko8MICpRdQsRfHpQthatvjbUz4uQ+tMf+QHsOfAEEN5iIl5nhOFFUkLcmjLidPQ6lTKlSXcTCiUfmdc7ONvPDrFwwhK8vhLMn99Gyk8a3DGhGSq64eJruFldcpL1i2npm6yzpSL2Ns0XtBRsLTWdkBsgZ9jj8OmneKUoR5OIW2Rja9iX/97+zHpAzHuEVnaTDFQx6fc4GoJaOdNXYikwiVsnHONyXHahS6nmgiToz0oym7nWYcqfza68lxUbmRbXNJJW6K24J6aID6kf8z6tqVqSRTEU72Yr4g3G00tBM9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMTd0ElL1VgKdQCfTT9zVKW+CL6pGZqKLWta6y6R8tI=;
 b=doE3p2rJetWIb34s+0S0jWtSuyJ5X+uyzqQcqkCKZzDHXTFNxyiUDEJfPiBZP288BpxV2h5H3XexwsbbzMhHeM4nLfmBFb3fud10gdNMdQGNLSvtNYvmoD22te0A0HkrB4ZWnD9AJF9hfAMJeZa67v7H5ONZQbvPOklAiKP6kqFiBNc4kNHQw9JcSV0muYvvF5H96H5VuylFuvgttUdPTnVuufsWLMUCFY+z4z90nmP0xLOppvDpBkyt9jUpHosyEUWAYXjqrG27F8262Tt3hI5lyK47JGjkCh4Y4l/fe1B15AWNa/PaAC3wiebJXEAsaNax3bhfkb0HGHKcmi1Xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM0P189MB0705.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19b::15)
 by AM9P189MB1570.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:30f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Thu, 30 Dec
 2021 15:05:26 +0000
Received: from AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 ([fe80::1065:d9ab:734f:1947]) by AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 ([fe80::1065:d9ab:734f:1947%8]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 15:05:26 +0000
Message-ID: <AM0P189MB070518AE87393F1E6A6B1DB19F459@AM0P189MB0705.EURP189.PROD.OUTLOOK.COM>
Date:   Thu, 30 Dec 2021 16:05:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: USB3 disconnect takes long and ends up in warm reset loop
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Wohl, Tobias" <TWohl@arri.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
        "rajatja@google.com" <rajatja@google.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "chris.chiu@canonical.com" <chris.chiu@canonical.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>, sr@denx.de
References: <PR3PR07MB8116BD69B81F774A555615FAB57E9@PR3PR07MB8116.eurprd07.prod.outlook.com>
 <6e857974-8e10-21b7-8267-569c980d697b@linux.intel.com>
From:   "Wohl, Tobias" <wohl.tobias@hotmail.de>
In-Reply-To: <6e857974-8e10-21b7-8267-569c980d697b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN:  [WxCWbUwq7Gndkvj+WdyswSUO8X8gxu4Y]
X-ClientProxiedBy: AS9PR06CA0121.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::12) To AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:208:19b::15)
X-Microsoft-Original-Message-ID: <89bd21eb-c030-faed-014a-e687d3fcdfae@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e973324-8eff-4c43-060f-08d9cba5cf64
X-MS-TrafficTypeDiagnostic: AM9P189MB1570:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjrmLzX3Hn9D7/JqXySnWefjWt52Q80+mwe3CiZ7QhYiKz+/zVFpL6GjiEOiLTCMgByeRsGOwYHBUahgeaEMBPH67/V7oK1NzlgN5yEtuRzNesQ3TZ/jshO+HT9kzefB7kJvdrPhN+OCsX3hmRhm1OH6UOjYdbSuHaOz/0/7zSBqLjpTbxNHxY4TFE/GBfqGH2DMncWZRBR36CryRoHr1p4sdxHgbtG2dtcZnYnzN+tKMWCHtUAbt+QjnupLbFY3fO9CyPubUUMa7SMkbL+py7krr8DAtGf8cDX0VUuWda7cIhSEu35O6m+s0H5l95eTwv+q1l54bFAoBc1FdDSr9+O7lHUeUCKDlpRrz9Jdg+03JuzKxl2CVZSQAXcyS4hez0A8QApUJUZmDbL7anIOeDSVzEd4hvVbAqHZ74S8ktO2aLQKGE9z2eKDSCjCmKvknFB0gZuwjAnoBL1sOkyHFyodOn0fPazdZRFa3RAxWbnKSr/+uqLu8LJP9GAGlKADXgO2Tu7V0ls/f4tE7+DqahQOtA/keBV0I6ynA7m80+z8FYM5oHjAO2zAPoNNn9DRNdciRmTB3Ymkwpsy9CQLkZ+aMTl/hX0dSEN2QGiA2wnu0rTK9flx4KHgTmmgrhBh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJPaktuQnMyQzR2TEJFOXVUWWFFMGNISDEzdHRDZ20rRjFSS2FiWHJsUmtH?=
 =?utf-8?B?MTMzS2tGUm9FOHQ1Y1JHeDh6WjBHdFlDUVBiRnROdCt4TXY0MUFEb3BXcDk1?=
 =?utf-8?B?R2xCUVZwTUNkeE5LcmNUS1hmeldvVFJCWDhNTHhobXRsZlAwWGwrTHBna2FP?=
 =?utf-8?B?SnJtV05NSEZCNFNGektlM09ndlJ3blBVc00wRHBxaXo1RUhsNThDUURaQXJE?=
 =?utf-8?B?NHpzVHFWaSs0MnJEMTd6YTVvY3VkeW5TbWJXc1QwUDFVck9TaHljejVCT0dU?=
 =?utf-8?B?bDJSdUhmNjFOWEZpanJOejRUWWxlV1AxM0FBSGYxcXVIQjhIdVRIenh4TE92?=
 =?utf-8?B?MXdHNHdEamE1OENFMTV1ZDJXSEp2dmtuNTFYVXJSRGJhejh1Ky9zVVY2b1FP?=
 =?utf-8?B?bHdINkYzcG03VTNEaVA5ZFdLUjhuM2duUngyRkRKMU5OdGVvckxjQkpjb0d3?=
 =?utf-8?B?Q1BuVFB0TWxKSE9NdkdyWVdyaWlMdzVaWHYwdE43dVp6eEdpTTQrd21tQU41?=
 =?utf-8?B?Ry9QQXFuYzlKSjI1elNId2dPNS91V1V6cnFoaU5vaytZcDJjMG50RGptUjZu?=
 =?utf-8?B?NHZRTWpHdlJIZkc2czBBQWt6eDU1dlVuVDhBZ2VaeUVKU3RqY1ZXMEVsa2oz?=
 =?utf-8?B?ejNzbE9hdDZaMldGSDdWODZXMnIxVlg4T3hXTThBR1JFM3lTN2xIN3ZWY1RU?=
 =?utf-8?B?czVhVlJWTkdoQXBiRnNtSE9jbVRmZEhCMTJGY05lTms3azVIYVVkRVRTek5Z?=
 =?utf-8?B?NDZ1N2l6NWlPS1oxMS9MWHZWQWRoaVhMUEo4Tnp2amJrK0pUTDVnS2hXZGpC?=
 =?utf-8?B?emJRSXlhSzdOWDQxM2wwNFoxbE90L3lqeExQWXNMdVlsNDAxV3ZpclU1cTVQ?=
 =?utf-8?B?Z2wzbDBlaGdMQXErQW9MeHhycldRNlFKMFU3eG1lbTE4Ny9zejR0WUxtaFJi?=
 =?utf-8?B?ejJobk9TelNMWGJzY0RtNkVINHQ0SnRVRThqa0lFQ3d2dVk2MWdsa29LQlYw?=
 =?utf-8?B?eDlQeHhmSDNvYmdBY0ZjRmNYS2V5NlFpbXErVHpqb0w5ZUZ3eU5UV1AwcExj?=
 =?utf-8?B?RUJ5YVJQL1BtQTgrd0tUUGtPK0NCK0FSZ2F2cEwrMGEvRDY0bEJLOVZGdFhT?=
 =?utf-8?B?VTFueXpFMEowaGUyZ0NBUW4zWFhCYWhMdFhpOHBsSEljMkNJeGJId3VXcSts?=
 =?utf-8?B?TWg3SkZtOGZjWDNpY0pLckNBUkpwK1AzTGYzVFVXLzN2YkFwWEo0ZXZJWjMr?=
 =?utf-8?B?dm1URXBPVTJGQ0lmL0M4cVNEdndaeXdpUjNsMDNvcjd5MVJmZz09?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e973324-8eff-4c43-060f-08d9cba5cf64
X-MS-Exchange-CrossTenant-AuthSource: AM0P189MB0705.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 15:05:26.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P189MB1570
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 29.12.2021 15:07, Mathias Nyman wrote:
> On 23.12.2021 15.26, Wohl, Tobias wrote:
>> Hi all,
> Hi
>
>> I noticed a strange beavior when unplugging USB3 sticks. I'm using a zynq ultrascale + platform and the problem
>> still occured when testing with 5.16-rc6 kernel.
> Does older kernels have the same issue?
Yes. I have also checked with 5.4 and 5.10 kernel. Both showed the issue.
>
>> In some cases when unplugging  the USB3 stick it takes aroung 10s until the disconnect is detected.
>> Moreover after unplugging the usb driver ends up in a endless loop of trying to perform "warm resets".
>> After replugging the USB stick, the loop stops and everything seems to be fine again. This only happens
>> with USB3 sticks.
>>
> There's been a couple reports like this.
> I saw you noticed the patch in usb-next that solves this by giving the link some time to
> notice the disconnect, and automatically go to RxDetect from inactive state, thus avoiding
> unnecessary warm reset of disconnected devices.
>
> Seems it works for some cases, but not all.
>   
>
>> The kernel log looks as follows:
>>
>> [ 1831.312566] handle_port_status: xhci-hcd xhci-hcd.0.auto: Port change event, 2-1, id 2, portsc: 0x4012c1
>> [ 1831.312583] handle_port_status: xhci-hcd xhci-hcd.0.auto: handle_port_status: starting port polling.
>> [ 1831.312853] hub_event: hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
>> [ 1831.312874] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x4012c1, return 0x4002c1
>> [ 1831.312899] port_event: usb usb2-port1: link state change
>> [ 1831.312912] xhci_clear_port_change_bit: xhci-hcd xhci-hcd.0.auto: clear port1 link state change, portsc: 0x12c1
> 12c1 = Connected, Disabled, Link:Inactive
>
>> [ 1831.312929] port_event: usb usb2-port1: do warm reset
> ...
>> [ 1831.379730] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12b1, return 0x2b1
> 12b1 = Connected, Disabled, reset asserted, Link: Rx Detect. (Link value is unreliable while reset is asserted)
>
> ...
>> [ 1831.447759] hub_port_wait_reset: usb usb2-port1: not warm reset yet, waiting 200ms
>> [ 1831.655731] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x12f1, return 0x2f1
> 12f1 =  Connected, Disabled, reset asserted, Link: Polling. (Link value is unreliable while reset is asserted)
>
>> [ 1831.863726] xhci_hub_control: xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 0x2812e1, return 0x3002e1
> Connected, Disabled, Link: Polling, Warm reset change, reset changed
>
> The odd thing here is that the "connected" bit remains set the whole time.
> Other reports had a bit different symptoms after not detecting disconnect, such as reset asserted
> bit being stuck forever.
>
> In xhci specs 4.19.1.2 "USB3 root hub port" Figure 4-27 it shows that when link goes to
> the Error "link:inactive" state it should drop the connected bit as well.
>
> http://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
>
> (four bits in the figure are Port Power(PP), Current Connect status (CCS), Port Enabled/Disabled (PED), and
> Port Reset (PR). Those should be set to (1,0,0,0) once entering the Error "inactive" state.
>
> No idea why CCS bit is still set for you?
>
> Is the device connected to a USB-C port or a "A" port?
It is connected to a USB-C port.
> Can there be some retimer/redriver mux or something else between port and xHCI that messes up disconnect
> detection?

The only thing in between is a 2:1 mux and redriver IC 
(https://www.ti.com/product/TUSB542) for signal conditioning and 
flippable connector support.

I also found that when I boot the device with USB3 stick already 
connected that the stick is not recognized properly and warm resets are 
performed:

[    1.804909] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    1.804920] xhci-hcd xhci-hcd.0.auto: new USB bus registered, 
assigned bus number 2
[    1.804933] xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
[    1.804939] xhci-hcd xhci-hcd.0.auto: supports USB remote wakeup
[    1.804945] xhci-hcd xhci-hcd.0.auto: // Turn on HC, cmd = 0x5.
[    1.804951] xhci-hcd xhci-hcd.0.auto: Finished xhci_run for USB3 roothub
[    1.805054] usb usb2: skipped 1 descriptor after endpoint
[    1.805073] usb usb2: default language 0x0409
[    1.805117] usb usb2: udev 1, busnum 2, minor = 128
[    1.805125] usb usb2: New USB device found, idVendor=1d6b, 
idProduct=0003, bcdDevice= 5.10
[    1.805131] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    1.805136] usb usb2: Product: xHCI Host Controller
[    1.805141] usb usb2: Manufacturer: Linux 5.10.81-arri-standard xhci-hcd
[    1.805147] usb usb2: SerialNumber: xhci-hcd.0.auto
[    1.805359] usb usb2: usb_probe_device
[    1.805367] usb usb2: configuration #1 chosen from 1 choice
[    1.805374] xHCI xhci_add_endpoint called for root hub
[    1.805378] xHCI xhci_check_bandwidth called for root hub
[    1.805406] usb usb2: adding 2-0:1.0 (config #1, interface 0)
[    1.805478] hub 2-0:1.0: usb_probe_interface
[    1.805485] hub 2-0:1.0: usb_probe_interface - got id
[    1.805493] hub 2-0:1.0: USB hub found
[    1.805517] hub 2-0:1.0: 1 port detected
[    1.805523] hub 2-0:1.0: standalone hub
[    1.805528] hub 2-0:1.0: no power switching (usb 1.0)
[    1.805533] hub 2-0:1.0: individual port over-current protection
[    1.805539] hub 2-0:1.0: TT requires at most 8 FS bit times (666 ns)
[    1.805544] hub 2-0:1.0: power on to power good time: 100ms
[    1.805574] hub 2-0:1.0: local power source is good
[    1.805617] usb usb2-port1: peered to usb1-port1
[    1.805626] hub 2-0:1.0: trying to enable port power on 
non-switchable hub
[    1.805638] xhci-hcd xhci-hcd.0.auto: set port power 2-1 ON, portsc: 
0x2a0
[    1.906768] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x2a0, return 0x2a0
[    1.906800] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
[    1.906822] xhci-hcd xhci-hcd.0.auto: set port remote wake mask, 
actual port 2-1 status  = 0xe0002a0
[    1.906848] hub 2-0:1.0: hub_suspend
[    1.906873] usb usb2: bus auto-suspend, wakeup 1
[    3.640888] xhci-hcd xhci-hcd.0.auto: Port change event, 2-1, id 2, 
portsc: 0xa4002c0
[    3.640895] xhci-hcd xhci-hcd.0.auto: resume root hub
[    3.640910] xhci-hcd xhci-hcd.0.auto: handle_port_status: starting 
port polling.
[    3.640930] usb usb2: usb wakeup-resume
[    3.640941] usb usb2: usb auto-resume
[    3.641954] hub 2-0:1.0: hub_resume
[    3.641967] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x4002c0, return 0x4002c0
[    3.642012] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
[    3.642025] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x4002c0, return 0x4002c0
[    3.642046] usb usb2-port1: link state change
[    3.642057] xhci-hcd xhci-hcd.0.auto: clear port1 link state change, 
portsc: 0x2c0
[    3.642076] usb usb2-port1: do warm reset, port only
[    3.698663] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x2b0, return 0x2b0
[    3.698695] usb usb2-port1: not warm reset yet, waiting 50ms
[    3.758716] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x2f0, return 0x2f0
[    3.758787] usb usb2-port1: not warm reset yet, waiting 200ms
[    3.966668] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x2f0, return 0x2f0
[    3.966705] usb usb2-port1: not warm reset yet, waiting 200ms
[    4.382712] usb usb2-port1: not warm reset yet, waiting 200ms
[    4.382723] xhci-hcd xhci-hcd.0.auto: clear port1 reset change, 
portsc: 0x802e0
[    4.382747] xhci-hcd xhci-hcd.0.auto: clear port1 warm(BH) reset 
change, portsc: 0x2e0
[    4.382770] xhci-hcd xhci-hcd.0.auto: clear port1 link state change, 
portsc: 0x2e0
[    4.382794] xhci-hcd xhci-hcd.0.auto: Get port status 2-1 read: 
0x2e0, return 0x2e0

...

Here it seems to be the other way around. The CCS bit remains 0.

Thanks

Tobias

