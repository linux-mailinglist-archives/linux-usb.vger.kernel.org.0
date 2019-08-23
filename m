Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2DB9B125
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 15:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405682AbfHWNnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 09:43:14 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:35300 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731553AbfHWNnO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 09:43:14 -0400
Received: by mail-wm1-f50.google.com with SMTP id l2so9195450wmg.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2019 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JI2lq0WANO/N0vEHSJjAFUI7K4Bra/QdGekzJYqJiR0=;
        b=lF1JF5QIs5VX4WwgBxrjjmc/Kc7pzpnx+WG36M9FPYJ1bmXQ8jx+thtDDoIiWZ1sOG
         wVIuGC1PIFovPpkdnWXncEmbPKevw8viVH9+7Q8WESvc6p5VUQAcWC39pqbc1h24WKan
         9P+P6JYqNvXqFpVmTgAmycbniQ5gvOYH/DOowHykeQLwLeEVD9qtITNBXOzbuVh8N61p
         +iEL5lFkiTLOBb0rQWlesv0tqeVvS8U3zNnuEWA19PXo95pD9cHl01ncM7cGO3SQIQLi
         Iw6xh9u/DmE48T+5oBRFjgYGN238eSGCeuhqzSEYHJdnQX41InBhW4lOL5PckVr5jdVN
         nUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JI2lq0WANO/N0vEHSJjAFUI7K4Bra/QdGekzJYqJiR0=;
        b=qZSCvCzU5Dvfr0ZzJVw7FtbTzZ7FvYRTKK5derbLY+dD6T1jkdbPo51xrTRHxxerwj
         ScRXYoDMvfuwoINyeYrRKAZxCembq1WynSXSNREvq1kdtuzRT61SjsWg7x+MBnujwAQ+
         VR6pX4U7EvDfSyGNyMwoZqc8lOth39k2WvK8QC4vnbe2mwY4xlEinvNN0QFlZ9IMrJ3I
         CIS0joyY1C/yExmXJ0k3Ih2xCJ7bl2ThyydkCRnlbcQWXTZqeX2hyDc4j9fawHGijhkl
         jCLJftNScEvLPNWafYW7Ap8XdF9ss7h04kz4eS9xsfW3shIofPo8F3yL/QPcFbP8BhA8
         UPPQ==
X-Gm-Message-State: APjAAAXO2RZsXq4FGJ0QxfkW+GteS89AMnVN0QzW2MxQ5Ua9NgiIh5/5
        XYIXF+RHVcO40AfhvUz21UCi/rVl
X-Google-Smtp-Source: APXvYqxKuBpP+CE8wMsM9h7TnT6e9B79SzL08GLtLLlvoQu0YvUJvGklcPrxW/SSNhIHAkUOBzfiQg==
X-Received: by 2002:a1c:2582:: with SMTP id l124mr5661765wml.153.1566567791986;
        Fri, 23 Aug 2019 06:43:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:aee1:2beb:2fd0:abbc? ([2a02:908:1964:6740:aee1:2beb:2fd0:abbc])
        by smtp.googlemail.com with ESMTPSA id w7sm2313253wrn.11.2019.08.23.06.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 06:43:11 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
From:   Julian Sikorski <belegdol@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=belegdol@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBE40CmIBCACj+gI1pIMD0VGrZD4ugde8f3usLc0OE0OnPDXjqelxsC3B/x9BFoQrzfnP
 qJEtcB6F4V5MuEYutnteeuFsIkLHx6UIe9vr1Ze01XtN7Emsya/AKXaEcXYzUUjVmWn1NjJF
 ZlX0ML3mIQPERBDEY/aXAj7cVDGvkFVeKWIWE5KRqQWV2rYo0nizZTRYGB0z6KpMninG4hqF
 KvvpzhDS5ZnxijEYs0YAx0QllI4LjLTH3xLuYMnSbHzFRBh9zUsMttMnZdCudLZC6ZllkjtM
 ov/kIO35P5ygFJ9xlLyxMFkhXsARDWe3qwJCEHfJgtcblQD/LHuY200fTmrbwTK9Q4uNABEB
 AAG0JEp1bGlhbiBTaWtvcnNraSA8YmVsZWdkb2xAZ21haWwuY29tPokBOAQTAQIAIgUCTjQK
 YgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQLdUZIcIlWSuFYwf+J5lKOXWz+FJW
 Vn4b8Q237R/SOlZVwVfT9u/EjxGkploecihuzRadwXDMu030zdgo0m4lwEubOD5eMvzpBSYu
 Dc3fDPT/T5/O7avybt2w83hptPuwU4O0EmNrkgr6pHql1nxEvBpeB8KkJnexJww95Kl1YmBX
 c1kdRrAShNxiVQDpPnskGtnfK2eTqyuyhECApIVLxMIX5IsqGCpslRUR6e90iHd591iJgRT+
 Ji74QjkCQzJJVcKbX5T7HzbUd6mmkZjNbtog3g6WEPkI4Qdw+ZeDlSViN/SKPS2ptMMzxCOT
 neVuw3c6qM/VUo6AUTPSl+1c1rO2X7ZY5/Z9dCMP9rkBDQRONApiAQgAmurakWU/VVEKiPcM
 o5IsActeWERRTxgUXmliSp02YtBLYwOBQ6WUmJyhywOR8s3Wh93cHEPgEPI/n+cfytNxvpol
 liSXp3PZGJAmBSIq13d1lDYJBzDzNjUz6dj9YMV56zcsWbYF25grXbPY4acy/5RQXHWjQ4R9
 dtGCMd48dhMH6O0DvsiriRxJQrcXz0mgLSi79KVns4VgIuUuPCwPyF1zNUBs/srbgTuL+On0
 GjbK40GnJq/Zw2LhEGeicp0npoc4jshgVTtUXRQrGo04plJNpNg9Tl1UIbsHrjA1qz9yo8GR
 4MLgXzcyfM6h+wz6qC8eI7jx4VEZxMhXtalvywARAQABiQEfBBgBAgAJBQJONApiAhsMAAoJ
 EC3VGSHCJVkrpl0IAJJd8qETlL0XzNZsguk8LwXi0c++iTTbotw/zn1f7CgGsZErm58KqNhR
 UltAZvK+lOclNPbZRsGzoEdg4TIvSymWVLN6jyblhcqH4G9mxmf6QOLvYR5I02UQiIbKvTvv
 mFA8bgr2vXPFc8rBmFXrwyC3DOjfrnz23kGattsFWbRA2OBq7bp/05JVoMb4QRA2TIbbvsyQ
 g0MMs9VldhdVfZcFqU2qKwQs8fBr8BD+OfPeiYndJV4GnfYhK692viMjv/+dgOvYcEgtlFaJ
 TLeiWvwUUxJ7ai45p+gCHXUYPGwrH4Dm2HAw61vUDkbT5pVOeGlFsvtOVEajnQX+MOV93l4=
Message-ID: <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
Date:   Fri, 23 Aug 2019 15:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566567572.8347.54.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 23.08.2019 o 15:39, Oliver Neukum pisze:
> Am Freitag, den 23.08.2019, 15:31 +0200 schrieb Julian Sikorski:
>> it appears that lacie rugged usb3-fw is not compatible with UAS.
>> I have just connected my few years old Lacie Rugged USB3-FW to my new
>> desktop PC to see if the backups I have been creating on the laptop can
>> actually be restored.
> 
> Hi,
> 
> does that mean that we have a regression? How did you create those
> backups?
> 
> 	Regards
> 		Oliver
> 
Hi,

it is not a regression to the best of my understanding. The backups were
created on another machine using the same uas blacklist quirk.
I for some reason never reported this properly and have been using the
workaround for years now. The issue only popped back up after I tried to
connect the drive to a new PC.

Best regards,
Julian
