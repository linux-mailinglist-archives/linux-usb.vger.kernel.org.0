Return-Path: <linux-usb+bounces-3383-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45C7FACCB
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 22:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045BE1C20E43
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 21:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793C846543;
	Mon, 27 Nov 2023 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TViHzK5L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF44C1
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 13:49:58 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cf8b35a6dbso34479435ad.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 13:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701121798; x=1701726598; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RmF9D9vxZTfn6B8Vaor9EjErqZY4KIQFmaK+ozOWaQ=;
        b=TViHzK5LXBBzwLfMux7BWUMhPwD/9ebPOIjM/jbIWrv65HI8dQwhAFb3rxG81v+AYR
         83FzSydzSqNf5cyMSBThz+awOtiutXiFTXIOGVa2IXIFU9ystLUgFQzlqWzu15utOfgx
         3jesEm6HgzzPQ9uY/ZWBPqLcQBG7CzySDNfQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701121798; x=1701726598;
        h=in-reply-to:autocrypt:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5RmF9D9vxZTfn6B8Vaor9EjErqZY4KIQFmaK+ozOWaQ=;
        b=XnT8Y8FeRzGEd/RCZmdkzZhuxPd+vDMOavtbeDUHWE5OhdYj5XIJ+8An2+Yw1+uSKb
         an/64rGVBGWFsWHmxW1sQ7bNo9WW2wqmSnQHyKm4WT51/+9npr7syiYRbNShGXvZ77gb
         sHhZA5XlvSPxqCQXRE/PdgOx2wRa3MKG7fYn8vH4zUlZAFMOOIxGOZ1NFeicBYjM8vuJ
         Ya38AM9E225xhq5I1rIWYmDBdUGpU1DPPU+PZJ61QUxOro3/Nw2bssGqpE91JmX4snMf
         u5GE7V7wZq9VELs/LX8330DSJOpVtuFwtd8eRVv9c31upwHrS6hjSZYaTxMFvFLtM+CL
         vtaA==
X-Gm-Message-State: AOJu0Yzd5bx2c9R4WO0CJ0Q2KIGyzZMomMzQOQzKyqjgXQX59gkrr4h6
	y7I2FKKsK5opbaYAPgY+YWshRw==
X-Google-Smtp-Source: AGHT+IG1w7dG3oWdgffbNkOFOJPpwftart0pZfENhHW7voj0PwfgrzP2DUyvlXVNeEXyqeNIj0RE2g==
X-Received: by 2002:a17:902:f7c3:b0:1cf:f66b:8e9b with SMTP id h3-20020a170902f7c300b001cff66b8e9bmr70411plw.66.1701121798189;
        Mon, 27 Nov 2023 13:49:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001cfcd4eca11sm2567640plg.114.2023.11.27.13.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 13:49:57 -0800 (PST)
Message-ID: <71e96b4e-a0b4-4145-8174-a18cf1ccd06e@broadcom.com>
Date: Mon, 27 Nov 2023 13:49:55 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
To: Stefan Wahren <wahrenst@gmx.net>, Justin Chen <justin.chen@broadcom.com>,
 Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
 <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net>
 <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
 <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net>
 <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
 <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net>
 <CAMEGJJ0aL4VDoq06+JGHz9yx5nVvgbNULNKoT07myzVGNiyCoQ@mail.gmail.com>
 <b8a90433-e0fe-4148-a512-c0e9ace2b4b6@broadcom.com>
 <91ceed68-fe3a-408c-a858-095d5749b4d2@broadcom.com>
 <10383aa9-942b-415d-b70e-ade3a7aae6fa@gmx.net>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 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
In-Reply-To: <10383aa9-942b-415d-b70e-ade3a7aae6fa@gmx.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000863bc0060b294818"

--000000000000863bc0060b294818
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/23 11:22, Stefan Wahren wrote:
> Hi,
> 
> Am 27.11.23 um 19:41 schrieb Florian Fainelli:
>> On 11/27/23 09:44, Justin Chen wrote:
>>>
>>>
>>> On 11/27/23 8:28 AM, Phil Elwell wrote:
>>>> On Mon, 27 Nov 2023 at 12:39, Stefan Wahren <wahrenst@gmx.net> wrote:
>>>>>
>>>>> Hi Phil,
>>>>>
>>>>>>>>> Hi Justin,
>>>>>>>>>
>>>>>>>>> [add Phil]
>>>>>>>>>
>>>>>>>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
>>>>>>>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>>>>>>>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or
>>>>>>>>>>> the IO board
>>>>>>>>>>> does not have a VL805 USB 3.0 host controller, which is
>>>>>>>>>>> connected via
>>>>>>>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the
>>>>>>>>>>> built-in
>>>>>>>>>>> xHCI.
>>>>>>>>>>>
>>>>>>>>>> Does this work? I maintain this built-in xHCI controller
>>>>>>>>>> internally. I
>>>>>>>>>> wasn't aware the Compute Module uses this block.
>>>>>>>>> i successful tested this with a CM4 (arm 32 bit,
>>>>>>>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB
>>>>>>>>> devices
>>>>>>>>> (mouse, keyboard) connected to the host interface didn't work.
>>>>>>>>> After
>>>>>>>>> comparing vendor DTS with mainline i noticed the missing xHCI
>>>>>>>>> block [1].
>>>>>>>>> Unfortunately i wasn't able to get further information from the
>>>>>>>>> public
>>>>>>>>> datasheets. I don't know if the VideoCore does some magic
>>>>>>>>> tricks on the
>>>>>>>>> xHCI or i missed some downstream xHCI changes.
>>>>>>>>>
>>>>>>>>>> This block is held in reset and needs a bit toggled to get things
>>>>>>>>>> going. Florian, just to confirm, this is our
>>>>>>>>>> "brcm,xhci-brcm-v2" block
>>>>>>>>>> correct?
>>>>>>>>>>
>>>>>>>>>> Justin
>>>>>>>>> [1]  -
>>>>>>>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/bcm2711-rpi-ds.dtsi#L119
>>>>>>>>>
>>>>>>>> What's the question here? Does the XHCI block present in the
>>>>>>>> raspberrypi/linux dtsi file really exist? Yes it does.
>>>>>>> since i don't have any documentation about the xHCI block, i
>>>>>>> assumed the
>>>>>>> compatible generic-xhci is correct. But Justin seems to suggest
>>>>>>> that the
>>>>>>> xHCI block needs some special treatment and we need a specific
>>>>>>> compatible.
>>>>>>>
>>>>>>> Did i missed some xHCI driver changes?
>>>>>>> Does the VC firmware something to the xHCI especially on CM4?
>>>>>> The firmware switches the on-board USB pins from DWC-OTG to XHCI if
>>>>>> otg_mode=1 is set in config.txt, or if booting over USB MSD.
>>>>> is this pinctrl/pinmux available from ARM via 0x7e200000 or a
>>>>> different
>>>>> IO address?
>>>>
>>>> It's in a different, undocumented block.
>>>>
>>>> Phil
>>>
>>> Well if it works, then maybe I am misunderstanding something here.
>>> Maybe its time for me to pick up a CM4 board.
>> There is one on my desk that you are welcome to use, or remote into if
>> you prefer.
>>
>> To answer your earlier question, yes this is the same block as the one
>> present in 72112 for which we use the "brcm,xhci-brcm-v2" compatible
>> string, it would be preferable to have it backed by that compatible
>> string in case we happen to support suspend/resume on the Pi 4B one
>> day, if nothing else.
>>
>> I did confirm that after applying Stefan's patches plus changing my
>> config.txt to have otg_mode=1, USB continues to be fully functional.
>> This is the case with using both "generic-xhci" or "brcm,xhci-brcm-v2"
>> so with the minor request to update the compatible to
>> "brcm,xhci-brcm-v2", this is:
>>
>> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>
>> Stefan, I am getting a deadlock on boot if I leave your changes in and
>> uncomment dwc_otg=1 in config.txt, is there an alias or something that
>> the boot loader should be patching?
> 
> sorry but i'm unable reproduce those deadlocks, neither in arm or arm64,
> with eMMC or without eMMC, xhci builtin or module. If i uncomment this
> in config.txt, USB host is just disabled.

Here is my config.txt FWIW:

# A bit too verbose
uart_2ndstage=1
enable_uart=1
arm_64bit=1
# Custom kernel images
kernel=kernel8-upstream.img
#kernel=kernel7l.img
#device_tree=bcm2711-rpi-4-b-UPSTREAM.dtb
device_tree=bcm2711-rpi-cm4-io-UPSTREAM.dtb
force_turbo=1
# DWC-OTG <=> XHCI
#otg_mode=1

> 
> I'm using the following firmware:
> 
> raspberrypi-firmware soc:firmware: Attached to firmware from
> 2023-03-17T10:50:39

OK, my CM4 is at 2022-07-25T15:10:17, updating to 2023-10-17T15:39:16 
does not really show any difference.

> 
> Is this DTS difference a problem?

It does not appear so, changing the node unit-name does not affect the 
results.

> 
> upstream   -> xhci: usb@7e9c0000
> downstream -> xhci: xhci@7e9c0000

Side question: does the VPU boot ROM or firmware take care of 
configuring the USB PHY somehow? Should not we also have a Device Tree 
node for it eventually?
-- 
Florian


--000000000000863bc0060b294818
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIEJqErIDGkG5zWro
B1QVynniCfsNXV1HC4PczM/BSJRCMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIzMTEyNzIxNDk1OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCNly6lFvsF0wkPmnwYymnRuWCWsxX7iR2y
UTLs/hUVYyAFBW+I7qtE+702V3nNuod1B7WmKYjmPN101jnynSdHGOew4xznorFXLWqutEXcWfTj
QiCCpZ7ZiEv/Bf9mGd9+0AN/vMlHlW3a75dxyWIPMsuZc3T2ubZd3ibXK9Iya156EtJjinsZu+IV
0CisgrZhWzqELXFj5bNZ7AEKlki1ErKH5VClEjCRCbBODKKgUAglAh3/PP93vyAUM4xVRzSJkxv8
XQ5ZaebjP0/mdXtNpiuPsVaPZijGRuyFiYjHNa6WKJpq+8MpNT+qqABPymcCeMUwBcJquLzLEjxa
PHw9
--000000000000863bc0060b294818--

