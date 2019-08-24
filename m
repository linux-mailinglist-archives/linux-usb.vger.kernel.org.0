Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1439BC52
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2019 09:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfHXHIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Aug 2019 03:08:34 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:41245 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfHXHIe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Aug 2019 03:08:34 -0400
Received: by mail-wr1-f41.google.com with SMTP id j16so10500514wrr.8
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2019 00:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jz6LyYZxV3hB+lLdiDTKSsWt5AFwnGFMBjH3adgbrdw=;
        b=gUoGJXHpK3aVzmxwZvJ98B+IygPUQyVHxUe/RoafKjewqBeCmX2rrMior+u/+5P20F
         WKVgDFH5O1r5t5/kvf34jnepTidJFvYSJILe9RMjhSyXbzXCE6FrBRyahk0hovqGQUls
         CRtrBZX9UHhT7zHQICaOOmJCnwFGxbo5NBph05yTWtj5ZWUAtlUECo999Tddo4DnulM9
         Q0aFThxPhAK5XVeLwUfMiFOb0rQpvDQ6IbIJY/GlNxxOLbaLviI0HuJaqp9qYVkhOA2g
         zknGXKIqyiR0yRCZ2J18pNjZvzK5Rtsclj7n9cqj5Q6j8NAHkxaa9V6boOpepyhU0lFj
         Pkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jz6LyYZxV3hB+lLdiDTKSsWt5AFwnGFMBjH3adgbrdw=;
        b=H3+hx0+F7bQ7ivik2ye3LGraTXQP3LbWpt1LVGanGqhNP/x1egBC990cQafXH1W/JR
         nuwRPPHlaqvLlT6ndDejoBtj7gye7q/eZIGk9K1o/P1Zz4KdPwdoQYQtI51hEVyYnnlA
         /HdLcfdqDrh6U9YhVDDeXmW6/E0MijZSLq2PWvDNLsQEEJ2Jb/Jf8L8KEpqKYgdocTTI
         e4dwjDMJBUij5K8/MsOfG7h2VlABSWuA4VavjZe7rn0D26E2o415CbKV9FZu9QaLu4V+
         9MgO7enRfaDx1I14+hdI8rnFeM+DnQvrzthARuthMVEB677losRPIlH2pz0QrnDD25UP
         1akw==
X-Gm-Message-State: APjAAAXDLGAiP4AOGISLAxASDGgenYn+hf+2da9iUUXcdt7Mxe8eLISw
        5cHFeYIu56UV3/JMuRFhVbSBpW/e
X-Google-Smtp-Source: APXvYqzksTqEZf1AueLX5JTwx7Bx3irPXA9rKDE18y3YFbKPg9EQd+MURJp6SbHCxFEFCWHwq1568Q==
X-Received: by 2002:adf:afe2:: with SMTP id y34mr9194530wrd.250.1566630511789;
        Sat, 24 Aug 2019 00:08:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:aee1:2beb:2fd0:abbc? ([2a02:908:1964:6740:aee1:2beb:2fd0:abbc])
        by smtp.googlemail.com with ESMTPSA id c1sm4200577wmc.40.2019.08.24.00.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2019 00:08:31 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
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
Message-ID: <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
Date:   Sat, 24 Aug 2019 09:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566595393.8347.56.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 23.08.2019 o 23:23, Oliver Neukum pisze:
> Am Freitag, den 23.08.2019, 16:21 +0200 schrieb Julian Sikorski:
>>
>> I did some further digging regarding whether this is a regression: the
>> quirk file on the laptop is from 15 July 2014. The machine is from ca.
>> May 2011. Looking through my earlier posts to linux-usb it appears that
>> the addition of the quirk is related to this thread:
>>
>> https://marc.info/?l=linux-usb&m=140537519907935&w=2
>>
>> At the same time, back in 2011, I reported that the drive was working
>> after some fixes:
>>
>> https://marc.info/?l=linux-usb&m=132276407611433&w=2
> 
> Hi,
> 
> this is alarming. Was this physically the same drive? I am asking
> because we have seen cases where two different devices were sold
> under the same name.
> 
> 	Regards
> 		Oliver
> 
Hi,

I do indeed own two lacie rugged drives which do differ a bit. The older
one (which was definitely working without the need for the quirk) is at
work, I will bring it home and test it in a few days.
Having said that, it appears that July 2014 is about when uas was rolled
out to the public. So maybe the drive has worked using usb storage before.

Best regards,
Julian
