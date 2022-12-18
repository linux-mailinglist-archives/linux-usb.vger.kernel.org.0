Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C068564FF07
	for <lists+linux-usb@lfdr.de>; Sun, 18 Dec 2022 14:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiLRNtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 08:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiLRNtD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 08:49:03 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53191BC80
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 05:48:58 -0800 (PST)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsYzF-1omUKh1mCh-00u276; Sun, 18 Dec 2022 14:35:44 +0100
Message-ID: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
Date:   Sun, 18 Dec 2022 14:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
Subject: Regression: onboard-usb-hub breaks USB on RPi 3
To:     Matthias Kaehlcke <mka@chromium.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, regressions@lists.linux.dev,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gDzA7c/TuVoZ5rJbtljSuN6SqCdFsXHlW5B93ysBeqmWe8ZOPyt
 SNooWtEAufPMxGwxn3njOB2btZPe9CkIEaYijymWXjHLG0oVuCHbnlQvkxU1qpFqqcRp5+3
 XMe1uCNRZbTGOc6C4KZQ/C2c2XRKhbmhs+k7APeN0OUvPngWNx/WBfHwQA7B6INnRa2MQ8A
 iLil96GMpKnJoXLyViaRw==
UI-OutboundReport: notjunk:1;M01:P0:3yAJWckC6e8=;0m+W0zGZa8WnlFv9eyCdzZRl6Li
 Zod1H7//pg5BDMFqxVRgd8/HaByOiKVJHXaJvLnJwEQWJNCbu5Xc4oBosub5jQNNAcy354Z1N
 Z7RKm1dm0zzs61TOTSoBLHKiBQSf1feuokVAuVu2TMiQ7dMCE2pkvwyez3oztFEVkqg0fc79x
 BMDDKQ+2KSCAtKNhya0RCLuyxa6HpjGLZS9Hh8vkI0ui6+lBc2w/2EEMn9lOAVXr2IynGRBHW
 KN8Z+gcTpYdjSC98wdvMQQqETvB8n/Yjlw7G8mEAkb1YkgES4+3dOgKxHxC5c5axMlETf4VPb
 mzhMxD12Jhr34yUmi/jNpMtIbc3qjUuRrjnO5u/8j52xfwNeog9p6Kej5WIY3jswpH7ju0g/7
 nbUIXHjZAUf0/MTvVIGOk4zX/cJz+vsc1nYziHozg+DlqjwlZ3uH624nt56bo7M8jlzO7klkr
 jmyirLe2USBMfY0Vfwv9pDlU623d6bIRCV/vp7fcftz9mCgYO1+iHTESTiQ6mbhS3xzRpZI/l
 AGzd1Qt/hw7XteFLZmxZqo5R7DFBsXxg3oQn+35PsURl2uqLJB4G6/VlaffgFU442l0VyHOmn
 WjTzwQ+OGuGEqnZymhKwM3AquAI/NCjRgBprV9mYNHUz0bO/BScbrKp/wPLAZ6CKhd4ncq37h
 KpvnXxr2EjX2/Vir/IyCXR32P9XRgfUbxW+svLHhYA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

unfortunately i didn't notice this regression sooner, but the following 
commits breaks USB on Raspberry Pi 3:

usb: misc: Add onboard_usb_hub driver
usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub

After these commits (and this new driver enabled like in 
multi_v7_defconfig) the connected USB devices doesn't work anymore 
(mouse is powered, but no function of keyboard and mouse). Reconnecting 
doesn't help. Running lsusb hangs forever.

Here is the relevant dmesg in error case:

[    0.078446] usbcore: registered new interface driver usbfs
[    0.078516] usbcore: registered new interface driver hub
[    0.078574] usbcore: registered new device driver usb
[    0.078827] usb_phy_generic phy: supply vcc not found, using dummy 
regulator
[    0.078990] usb_phy_generic phy: dummy supplies not allowed for 
exclusive requests
[    2.897258] usbcore: registered new interface driver pegasus
[    2.903161] usbcore: registered new interface driver asix
[    2.908809] usbcore: registered new interface driver ax88179_178a
[    2.915185] usbcore: registered new interface driver cdc_ether
[    2.921281] usbcore: registered new interface driver smsc75xx
[    2.927305] usbcore: registered new interface driver smsc95xx
[    2.933298] usbcore: registered new interface driver net1080
[    2.939219] usbcore: registered new interface driver cdc_subset
[    2.945407] usbcore: registered new interface driver zaurus
[    2.951238] usbcore: registered new interface driver cdc_ncm
[    3.030909] usbcore: registered new interface driver usb-storage
[    3.178104] usbcore: registered new interface driver usbhid
[    3.191022] usbhid: USB HID core driver
[    3.981848] dwc2 3f980000.usb: supply vusb_d not found, using dummy 
regulator
[    3.992467] dwc2 3f980000.usb: supply vusb_a not found, using dummy 
regulator
[    4.053728] dwc2 3f980000.usb: DWC OTG Controller
[    4.065343] dwc2 3f980000.usb: new USB bus registered, assigned bus 
number 1
[    4.079415] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[    4.463447] usb 1-1: new high-speed USB device number 2 using dwc2
[    5.063444] usb 1-1.1: new high-speed USB device number 3 using dwc2
[    5.523440] usb 1-1.3: new low-speed USB device number 4 using dwc2
[    5.685546] input: HID 046a:0011 as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
[    5.763446] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
[    5.777968] hid-generic 0003:046A:0011.0001: input: USB HID v1.11 
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[    5.931991] input: PixArt Microsoft USB Optical Mouse as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
[    5.954668] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[    6.263459] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
[   14.828915] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not 
found, using dummy regulator
[   14.829493] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: 
supply vdd not found, using dummy regulator
[   14.829729] usbcore: registered new device driver onboard-usb-hub
[   14.829945] usb 1-1.1: USB disconnect, device number 3
[   14.829958] usb 1-1.1.1: USB disconnect, device number 6
[   14.830419] usb 1-1.1.2: USB disconnect, device number 5
[   14.854725] usb 1-1.3: USB disconnect, device number 4
[   14.896865] usbcore: registered new interface driver lan78xx

Unfortunately i'm not that USB expert, so please tell me if you need 
more information.

