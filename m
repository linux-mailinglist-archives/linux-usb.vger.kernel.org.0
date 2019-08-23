Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF119B1C5
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 16:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395169AbfHWOVx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 10:21:53 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:56104 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390998AbfHWOVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Aug 2019 10:21:51 -0400
Received: by mail-wm1-f48.google.com with SMTP id f72so9072371wmf.5
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2019 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u9Dhw7yNt20mrnDiT/zckRo/6uLB8ahsb/fcxJjuJ00=;
        b=Yxu5swjXF36ANZc21Z99yQs7Eo0pFuGJqONSbdzUCHNYcvfYQu9mJTwNP3XZR6Axe3
         YJvGLQt7u4h0M3BrKciig/8siVxr+4kEnQ/8eGyLocC7j5NUlUliQwf8DN8pL+c5pUxZ
         lwNBM2oRfViFkosgZkZUYohnc9Cygx/tLZFt+HcswwN1ZPux/hMpKsrMwn4KafB213Xg
         /mWKbZlCDzDM34Ton8Za1bK7/Gh7CsOHGJEfh93GJPrLbs6YPrTF3s1t/zA6lYvSQQEI
         JV1cmnubYEG0JWW0+9/PI3o24nlFckesLrZqb9mId2Pk8b+4YX9TNuBW1ZM6hL0+zAmp
         MZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=u9Dhw7yNt20mrnDiT/zckRo/6uLB8ahsb/fcxJjuJ00=;
        b=sa9xk/NlIfNHC8JyVEczoEIdOaTFbBSeytSLJq0MpWLl7EBTpUYepJ5Yq5CoiswSsK
         UaGql8LwMx0DxHkK3Xh1psEohgiU1uNpbW1id/ZHit2eWrN4B/IN1Nzmcf2Mcw4RM8SN
         afVTKQ3RAqZcCZ7YLBUbfSRTBNlxQPNBQ5vA/cHdZWRWznu38AUesfc0rZjSKr3XaYDD
         VhzSiqTyUwFJ5wl03XZ32ME+y3Bqk3yEAq6rpCFLr7QMfFWPTa1qz4gAGTFZZmTBCsJy
         h3hzbieJut8mbUD2zNHumld+sbeRoTDzcQD69e5lSy3OIxJL2ntUy8g+I11bV24hpIah
         yT8g==
X-Gm-Message-State: APjAAAUyu6IhbIdwv8BuLRY45OqsTn3tEJtlgR9AiLX9Gr70bORU9Kzr
        P8VdJtG99g9IKH5iJjVNLqBHX7yc
X-Google-Smtp-Source: APXvYqyIqXpBVUDGI06IS6PfL6LIrmnh8+RPV8BAs8Na22SSGwQBmCaKhXmOMPEe6h9fyrYICay6ow==
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr5792559wmb.154.1566570108598;
        Fri, 23 Aug 2019 07:21:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1964:6740:aee1:2beb:2fd0:abbc? ([2a02:908:1964:6740:aee1:2beb:2fd0:abbc])
        by smtp.googlemail.com with ESMTPSA id n14sm9550562wra.75.2019.08.23.07.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 07:21:48 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Julian Sikorski <belegdol@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
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
Message-ID: <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
Date:   Fri, 23 Aug 2019 16:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

W dniu 23.08.2019 o 15:43, Julian Sikorski pisze:
> W dniu 23.08.2019 o 15:39, Oliver Neukum pisze:
>> Am Freitag, den 23.08.2019, 15:31 +0200 schrieb Julian Sikorski:
>>> it appears that lacie rugged usb3-fw is not compatible with UAS.
>>> I have just connected my few years old Lacie Rugged USB3-FW to my new
>>> desktop PC to see if the backups I have been creating on the laptop can
>>> actually be restored.
>>
>> Hi,
>>
>> does that mean that we have a regression? How did you create those
>> backups?
>>
>> 	Regards
>> 		Oliver
>>
> Hi,
> 
> it is not a regression to the best of my understanding. The backups were
> created on another machine using the same uas blacklist quirk.
> I for some reason never reported this properly and have been using the
> workaround for years now. The issue only popped back up after I tried to
> connect the drive to a new PC.
> 
> Best regards,
> Julian
> 
Hi,

I did some further digging regarding whether this is a regression: the
quirk file on the laptop is from 15 July 2014. The machine is from ca.
May 2011. Looking through my earlier posts to linux-usb it appears that
the addition of the quirk is related to this thread:

https://marc.info/?l=linux-usb&m=140537519907935&w=2

At the same time, back in 2011, I reported that the drive was working
after some fixes:

https://marc.info/?l=linux-usb&m=132276407611433&w=2

Summing up, if this is a regression, it is not a recent one. Moreover,
as the problem appears with two machines of mine and for two other
users, it seems more likely related to the usb drive and not to the
controller.

Best regards,
Julian
