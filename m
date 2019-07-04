Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E095FDDE
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 22:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfGDUrx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 16:47:53 -0400
Received: from mout.gmx.net ([212.227.15.19]:32807 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfGDUrw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 16:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562273271;
        bh=26fPD/mu2KXmqfPSVY0sY6E9aWgXFS3AiXIK8JFRjXQ=;
        h=X-UI-Sender-Class:Date:From:To:CC:Subject:References:In-Reply-To;
        b=Y+3bEZKw7ZlbTeJRKvr9S5bymRkqCeQpqACXZ7ROXmn0e/x/w2ECSPGUbkiS5IybE
         nabYwWS4Np0UPRsK2xce5NGWWquJWcqp8RxnfrIfEhq8NU5ZO8cGqT9/x/OLzQATbU
         osZauJp8yPLRHiEc5qYAJKxa8IePnKUUIrU6QnW8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.102] ([94.218.88.45]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1hl3Vd3YS3-00GEuN; Thu, 04
 Jul 2019 22:47:50 +0200
Message-ID: <5D1E65F3.6090307@gmx.net>
Date:   Thu, 04 Jul 2019 22:47:47 +0200
From:   Markus Breunig <Markus.L.Breunig@gmx.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     linux-usb@vger.kernel.org
Subject: Fwd: Re: New USB Device
References: <5D1D1376.7070202@gmx.net>
In-Reply-To: <5D1D1376.7070202@gmx.net>
X-Forwarded-Message-Id: <5D1D1376.7070202@gmx.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hZ5rAfhhAjK8sMnGjjTFwRgPPJjzXPLYL19Jko7Arf7wES+9kWs
 H4SjzyCEeF/Zv0FqS9FpWWjEEYrDVDSzPqFkK2p1GI83d3rQTKB+B/7ZHF5kzyHWy5X8VB/
 8vQ9/sZNdq7Ujmp2ntvCyFoBAVdbHdQA4wJYvYBcqSpKFZIQN+dSeaNa/qYJRWrXE0p0j5Y
 GzroYis+bNCqvrdW67Idw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T80DfdFwMB0=:68A0C4g35z+G/p/dch0NXy
 b/1OcDiYwYGJe4UvggwGdYDs/48VhiWaIAv6W8yr4lsbg5SZpNH1GolnTUvs/Zxx0p4Ie4lnW
 RIMYrQaSeeJgs43I0En4RxIglu+02X5scPxY1u6otXCSkCt20HRIfGPdrmLHh5RKmRJtqJS9B
 e2pA3LH74DgmNh7IL05vgRHY44bWIY6GFGDQDTCTxFQPEK2FlPpVuMziaaKeiHm9i+r+44FRP
 fZomykJAP+bGNsWvcD3aLE07z1NDap5ezq+1KBjDFnu9+3dqNdyPHjmJu2jokdxGAhCKoq9rB
 fjcHF4slIvrpl3H3/wcS4xIuBY4DLMRGuotljNudciydG9wGVEYgYBronZFF6tsH2N1dQYFYy
 tbPUV2XHaL75EgUUW8CyDvQwbgksJma0vvD+7tHtnBNSumtWj9GAy96sE4FJpI4QW4ggR+pb9
 dBPOjO+jpzrSFhC/pcuY6JT5v9f42GC0DAY9isDNAsIMMU7VCKStyPukEB/36jJPVYsp+u5yY
 l/2wId+anC/tGzywbrsheJHqNOSAh8sYNTFXPGSZOIq0oTjZ0r+uA0Lai+aEuyQRte1IL/NrP
 6H9C7VePeD/244uPJ+e+ORm4eByUe2D+dPK2KeNY1p4aVNXr3mXk9OpZ02WtCO41SJFedzfXQ
 p/tC5T8/G8uH8K2+H9bAWRkC94IpAJ7z35fjJ6eaUTmGuuCJ0oMqAOygv3XcUzmZf+ke+PBa6
 3TwdP7zme44kErYdSh2FBGzquCuhNX7X2ZkIfXbh5ZbsA/qEY/YcGi9B4OPAIZ9+pLU6Buuac
 IpcJFXVju1Q5DKSCcr3AG16cC2zPbfaJ6ejCnFV07xRZvLIatssdaVkbpmBn4pGuPlQmo5pjK
 rQ+gFcZ5jZFvWJo4fk6y0QRnc4f9geXrHmUDXzOM1mN0hlym18Gq4qA91naMtl1Tkl6F66Vj3
 dpLQfwZWSOwCw8i2y9+NDp7b25OE9uMFxwwM306trBflglhS2id11FDt1pvl8E7HqYq6+JIMN
 /sIfhF2xCDJHMHHayKzi89xJpsmo3fAHS88S7NKZ49kDpzl30ReeEPpOQDbX3hbji9IEh7h43
 5w3aqcHCcvOyuSNa8+I4B+MzwcCCyF9KWdG
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

using a serial device driver is the idea of the manufacturer
"www.gns-gmbh.com". In the LINUX instructions of the ADS-B receiver some
hints to use the device are given via usbserial.

In practice the "GNS 5890 ADS-B Receiver" is similare to some GPS
Receivers with NMEA 0183 interface starting to send information on the
serial interface after power on and signal availabillity (with 115200
boud data rate).

does this help?

best regards

Markus

Am 03.07.2019 18:38, schrieb Greg KH:
> On Sun, Jun 30, 2019 at 02:18:24PM +0200, Markus Breunig wrote:
>> Hello,
>>
>> my Raspberry Pi told me to send you the following information. I hope it
>> helps ...
>>
>> best regards
>>
>> Markus
>>
>> --------------------------------
>> [    2.081893] usb 1-1.2: new full-speed USB device number 4 using dwc_otg
>> [    2.219804] usb 1-1.2: New USB device found, idVendor=04d8,
>> idProduct=f8e8, bcdDevice=48.12
>> [    2.219821] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [    2.219830] usb 1-1.2: Product: GNS 5890 ADS-B Receiver
>> [    2.219839] usb 1-1.2: Manufacturer: www.gns-gmbh.com
>> [ 1517.863755] usbcore: registered new interface driver usbserial_generic
>> [ 1517.863830] usbserial: USB Serial support registered for generic
>> [ 1517.863916] usbserial_generic 1-1.2:1.0: The "generic" usb-serial
>> driver is only for testing and one-off prototypes.
>> [ 1517.863927] usbserial_generic 1-1.2:1.0: Tell
>> linux-usb@vger.kernel.org to add your device to a proper driver.
>> [ 1517.863939] usbserial_generic 1-1.2:1.0: device has no bulk endpoints
>> [ 1517.864009] usbserial_generic 1-1.2:1.1: The "generic" usb-serial
>> driver is only for testing and one-off prototypes.
>> [ 1517.864018] usbserial_generic 1-1.2:1.1: Tell
>> linux-usb@vger.kernel.org to add your device to a proper driver.
>> [ 1517.864028] usbserial_generic 1-1.2:1.1: generic converter detected
>> [ 1517.865108] usb 1-1.2: generic converter now attached to ttyUSB0
>
> This device isn't even a generic usb to serial converter, why did you
> tell your module configuration to bind to this specific device?
>
> thanks,
>
> greg k-h
>


