Return-Path: <linux-usb+bounces-7684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960A875526
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 18:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD44D1C21C53
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 17:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EA8130AF8;
	Thu,  7 Mar 2024 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOZG6QWe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037E12FB26
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709832545; cv=none; b=fO/b4B+6v3loJeaWIar9acTrNa0oAeT/6yXPC1xM7t9kbSfISSFHACmN1U+3ctjQL7MWakbCbq/HVFD1Hm8oJwN/ms7HLvc724WUBByzF+J2qAM/X2gAuFL+9w/Xu120NPYKsXxzhNg2IU0U65++bkvynXlEejrrcl96ibb8niA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709832545; c=relaxed/simple;
	bh=OeyeooG3x/KM/xqq2V+mTmSGim6s9l4Srbfsa0TZodk=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To; b=rBKT3T2kIsfOBafJVxiBedMVFsa3/eoyxmcSDU/wOzGr5SeXI81AY/vRk///6LZukDbMpc9tmFUrZzOC+z5iC8s92MVbFKqKu+JBUWT4ad0QjaJY/k6pF/x1fd5cHHnJLfr4yrq19K9tgZF3XGAEepXdlw17Jigr4WOtNBQ5GX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOZG6QWe; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c8406e4745so45427039f.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Mar 2024 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709832543; x=1710437343; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlapvcHJdTj6Yq+FZlNK32twylZrvWPdSkz0IdXBaqw=;
        b=kOZG6QWeDJap0unWC8UYSxvwFBoaVtwG7TCPkLyip/2+8j41DLri+zMoaXm5N4BHVN
         yAThL5bEqd8XfypaS8Voq6IY8PqezYIkZ+ZcbFm8tUghoc0uWtnHlXuxAVLnDMSuR6Tw
         FnHCoGM3gqHEfAcHCl6PXMpK01kQcpoR/QW4NqKGlqWXmdEmbcPbCa1CiCzWd0VktWRg
         FhnOE4SGp8o/LQxQrZngAZo6v1Yf/U1+zFSzuNHnyuf2XF7tEr9GMA19P60cS/dzNfQ6
         1cd9W4SilULYQ6pmZmFt3Lq5/MEmhuzUtlzJ6v1rrr6w2uzebTtleP38anjDeyUcOofs
         9dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709832543; x=1710437343;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vlapvcHJdTj6Yq+FZlNK32twylZrvWPdSkz0IdXBaqw=;
        b=beyTHN/5ipd0OI85PQz23/291lDEmVJPttaYah4x8tKyKzUA7IcI0LmkZ32ZfH3/n4
         4A3EGX38eQyh00B1kWoLG6ZFyxvV15aQA2GoU4rdYhJWDmJ8CPdJms1qSBiVdpnKFTyl
         Rfi9V91pUJz6Q8rgoQfhxSksaMEQjxZAx69zH6Wb5jEcxoVNqYqKQgt0C0gGakFPsZQk
         Cj3EjIPL7lOhgJMsBzhu46RA3DC8biplqyRmevNN2nVBvaZA+doZ6n0NJyy4U9nid7gF
         d5xyiFxNtJeEk9+w0uHGhffNP7ZUvIBHbK7SbnKnqtPxbdhZMh798zc6lCZN9sashQD1
         QDWg==
X-Gm-Message-State: AOJu0YxqKTI9lIOIjhvpKdVbwaGUC58a1Hl/bkrOlZIYRa0yjsvMJg6D
	5dmsZGjJxKBql4riaTN82im0ADLPU3ZAoLdKXV6rHGZn8JJrUCeU
X-Google-Smtp-Source: AGHT+IFhrZxXYogvQXCQGXyHwo9iwz5xZWRw0No0Z/jTGc/BlndgepNeQMZRb+VvXXfj/YfVb0kH4A==
X-Received: by 2002:a6b:6c14:0:b0:7c7:f9a9:ec4c with SMTP id a20-20020a6b6c14000000b007c7f9a9ec4cmr20397435ioh.12.1709832542517;
        Thu, 07 Mar 2024 09:29:02 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1204:db7b:6df3:1a86:f66a? (soda.int.kasm.eu. [2001:678:a5c:1204:db7b:6df3:1a86:f66a])
        by smtp.gmail.com with ESMTPSA id a36-20020a029427000000b00474393b4ed5sm4199567jai.10.2024.03.07.09.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 09:29:01 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------oAUNOWUjQdxi9r0GeJiZVJEz"
Message-ID: <78fb735f-3279-40a3-8d12-201a62b13942@gmail.com>
Date: Thu, 7 Mar 2024 18:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH v2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
 <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>

This is a multi-part message in MIME format.
--------------oAUNOWUjQdxi9r0GeJiZVJEz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-03-07 17:04, Klara Modin wrote:
> Hi,
> 
> On 2024-02-23 15:03, Mathias Nyman wrote:
>> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
>> "not connectable" are not wired to any connector or internal device.
>> They only exist inside the host controller.
>>
>> These ports may not have an ACPI _PLD (Physical Location of Device)
>> object.
>>
>> Rework the code so that _UPC is read even if _PLD does not exist, and
>> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
>> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
>>
>> No bugs or known issues are reported due to possibly not parsing _UPC,
>> and thus leaving the port connect type as "unknown" instead of
>> "not used". Nice to have this fixed but no need to add it to stable
>> kernels, or urgency to get it upstream.
> 
> With this patch (f3ac348e6e04501479fecf55250b25ff2092540b in 
> next-20240307), my machine fails to boot. I was able to get some kernel 
> console output from the pstore when compiling USB support as a module 
> instead of built in. Reverting it on top of next-20240307 resolves the 
> issue for me.

Correction, it does boot when building USB support as a module. Got more 
logs from the unhealthy system and lspci. lsusb shows a single USB 2.0 
root hub and nothing else. Calling it with `-v` hangs and produces 
nothing useful, the same happens with lshw.

> 
> Please tell me if there's anything else you need.
> 
> Kind regards,
> Klara Modin
> 
--------------oAUNOWUjQdxi9r0GeJiZVJEz
Content-Type: application/gzip; name="dmesg-3-decoded.txt.gz"
Content-Disposition: attachment; filename="dmesg-3-decoded.txt.gz"
Content-Transfer-Encoding: base64

H4sICCTz6WUAA2RtZXNnLTMtZGVjb2RlZC50eHQA7Vrrb9w2Ev/s/BUEegHsO6+XpEQ9Fm0P
jpO2RuPGsHNoD0UgaEnKq3r1gKSN1//9zVDSrqTV2onjHPohQuKVxJkf58XhY/Qngcs+sajN
qfuB3OhUF+GS5EVWaVnFWUqicLWsjvHNPJwv70mUFSTN0okM4W8sgThUqtBlSeja8rjLbD4X
UaiE9GaEwkX+/I59IJdXb95cXL4n1xeX5Ld3l+/PX/y57ZoBwdnlf2aEMXJ5/npGHMrJWZYk
M3K4Uvrj5C4rbnVxRH7LKlKFcVppRZwT74ROCulOUr2uJpxym1rUJd/ZXPTArQ/kl7BQd2Gh
SRomekYuYllkk+sqLMg5YBVpiKqCKmfZyTF5W6kTcnE9cc98Nr04/Zm8EoKS9+8uTn85/f1X
ctg0HR2TV+fvrsnpyU+UMDpl/hRksHpdOx/I1fkl2oHR2W1UaE0OT6ZxKpeg1nQZp6v1NA9v
9CRahjflyWLGbZccqriURZzEIBYYmx+RIUuSACmzqDNCmyTTcrman8iZDe7YJTgiIGEtHgfL
nGUKDOJRYnuEMqLgb0SAT3ACPgDvUdMkXSLbR/hX0/M5YYJEmoA3uED2BqRmYUTDo2zvgdEx
BBahgii55fre9n4k3pyAlalHbJ94PpE2iRzTJzMSCSKlua9FiAiLiG23AvovTpdLIkGXFz80
1wvwAp0ddDXbXAdZMcfff9C18o7pmh2+LML1EbLYs4NdAyDLX4YDgpwLiYTh7GDULgdJ9rHB
jprLo/V1/LJQa+BlzPDumu+gXM3rThgXWkUa5IrzI8PXyv5d06qZg1CegaqN3r0OYFTiL7Ie
o3ZIPK9lbh2zJS4XRSOz3BBHG2LjuS7xsiF2WmJu1WLsuLYVo9FIyY1G4a5GFDXi4eyfiLWJ
h23HjWXp2qv9ZexycPD9ZEKqIszzOL0hcVpWxcqkLgTTIFcbTz3zNFiIAzCMA7EFbtnEXI+4
0mVVa8yOX6ol0jZx0g9LEyepbuLEqGOFhrAbrQ1omuVLQ0gPGyngD8MgtCIj9e51UOj1ye+v
XrzAUUtKyF8V6nwXVwtSLXSdq4dW+OHTr2bMfIb1myHzyTYm7qfbmISP2pgpHIuQWz/bxkw8
YuNOGueYxq/rNO7NcESHNNQ+88LIjih589Pb05+vzWTHKEyjPVYfWE//gMb+3EjJ1St4q2no
OEI5kZ4L1we5r87+qGfN9mKMzruAFkyVV68bIpdFTksIEp7PSJtyJHU9pXQEtOe73fQAYRK4
enVZs270EtwjV9Try1J3Q/3dtz1AGwDBJQbQg649i4eh4wMrJL5+N7aHb3mHlnkq5G4fEM3P
rA6R42glBbLa/beSQshegW+HEvo9QO8D+QkcVtswEpZmAhSm9BBfHBFwZg3KmKulxJdNy226
hMaHtLcpzKk1NqPk9XWzBnrT3pxd0a1w0KWg1OqtGWwOAFd81hEunHNpIau1YQXJfOnUgHZX
W0tQHfUlAn+chTA9vi9CqWe9JjAE+f796fWvP3ZfC4ixfxMV6wCXduQwLORiuvacKazBUr2c
qlWSQ/KRt7jI4Iw82O5Qs+LYgvsIrtcyaBabQWexudMV5vUSYBzf3+lm02bb/S4cD7sIyyTY
183JdAPWrqyAfBqrSqdVcQ+rK4e5fVDXgK7KeRDKPA6iOFWBzJI8TA2iKuKPuiinQDCVWaHx
ZoKUICDzHfJQOwTNg+2w0DvCnvF9RySLG5H+RsvKjWSYVP5WpsKoM8LAbiKWOkizKo7ut7Jg
2/RmudKI4fTjyXIgATV8uJzZMM3DUhsJUDCLbSXvNljCG8C5jXEWq3kgCx1WOsizompEG7EP
tgKSa9Ex3WwKKQexcIs2xr4wbmMubK72tfli1Gw2RhiKaqAD3HcVUTgqY/0Cw4OOSynAiKDs
cnk/FNRYSynghcmJ7L51hNczIKQUjPsgyKN1ELQeDSvIOIugZh8D9zkfwECmDRqGRsOhC7bc
HqUDbgyKT+S1hry+6flTBRd+n90FweerMoCteKBr3o8DRmhGXzCbjL1Gb/cAnR15xgRhdKiI
69eSPGCBukthDYzvWY+PKRiIA0E9t47HUleQUdIovlkVYTWeVRJdlpADcWxyxsZiUrAGzkwR
sezFwghiQ4aIQowC4uS9HS97B/RmsHDfHsVx3OcaLMJ9lsEi3C8ZLMIVTx4sAifepw8W4bHn
HSyQzp82WITnPXGwCJ89YbAIX9TBmOq7/aFYTwDcsa2xQHQ4x0C8iUvI/EGRZRXOWmMw0hh/
PJwdu5lGQPgAKPfycx+jdwQA42e9kHGQ4//d4bnIymqKBBMgwFHAQZCWoQuEzltmEpeDu0jw
Cv9PNsPT4qJnUseDfIeMjTMe5fd3VkqQiPaS22xnlfYguWC75H15ffu58ojju708Ug/mB8Kf
CXcA4H9BBnEpf3IGcano9PyAyBzsP6qJM8DzhilFj6cUy+kb0WVNMsKBMJrDaj7HtQZ82/zZ
jsahBpspZZAGXOZtHbcZQ3EaV48MIdR6ZAi5eGqssiBLtUGRuLU8xLtpEsapsaM1UJub2AEm
JAuSTK2W4LlmG1c/tsxc8H7cuHie8Imsw34t6LfDF0RFlsB2ZC8CrOEHCLh5jpVO8gx3hn0h
htunMo9TyC23sImyYGju6cHa2+KJQd9m4ls7dlDel7iLeqBvVAr6hW3eODin+1qY5+9v6QuE
5wLgCZAGnR44dme/bvbNkMuTJENmMZb49hF71iN5zBUQ/4YpuP7v9dnp27fQeRBGOCkt7qIi
TPSOKDW5Y59cQ0AOFfE3dRnLmtF1fcziMz9SflsdcXF7UFdHoohIizgO4bqpPHj29sx/vCLh
4YFo5LU3bnOjnOZGhsRW5oa3N0As8eAV/nIbz14Bk4q6OmIpPAGNKMoC/1wLH0Go+qiWKqR1
tLmh2JvyCLgHUE1RZm91pNZscB1AaOHvSz0357t8djCq+4EsSZrld2PHq8SfHWxsg8/yCUe0
dZmktmNPwM3Bsoo35Qp7Q+zuIS6RWMVI7LbEytmHjJKUhjhsicFn48RyvSntKCBu/TpO7OFZ
OMXiBN3Q7tPPB1qvra/0g6NPWp/Kl6ay4iODZ+wN4TN0bjN6O5WWQWwhkUxy/O3UsMxFKTP2
frDmYoFadXwOu/4rbI7tLQvpIK52g4+YE/gK2622EjEI763OytE02lSUZK+iBG223xRg6gEx
7CbVN8bK2gSQBRG6GTKj3tAYnVE5O8SuNnWaHVzS1hD+D2Waz3cd8jqPOggNR7yH/YND/Mv8
w6KmePMp/mH8s/1jajwP+KczIzj2psTD57P66D2Sdsgj4c+9bokHCGyHvLs6/zmoCzu9ao3l
91CdpvrTc0Wkwrr6gxxCaOXA1o1x1an+DCakLaDXqf70yzJY/dmyauFaYCpT/elTwmzQBfSb
6s8u60j1h22rP125u4B43GCqPx01IhbKpvrTg0NDmupP992goOLiwYOp/nR6Fa5ym+rPriHa
6k9Da0sx7wO6WPSYDqseLp4zXJgVUElgUXWrFYzPGcmrnOR5GeCWlHyEtWBGyhS2sSoMcEaV
cJfEJEzUWuYk5jIIlzdZMIfldRKpmksW0uKwjF4mq+WGGQ9Tl3WTbB6wydwFqsxldANLfixh
aEluFmG5CAxAGjfUN/kqKOUCxCwXoWA8KMtSW4anXM0hxWcgm17msFUAAi6chqAnvSGfr5S6
RyLWJblTGhS6W97FUWzIYImWL8P7FjTU5UYWCUhbXFAZ6asqaWnbfcThv45A5fu8glVknCii
P+LWKQlB0liROezNdHFvkHKZEACoOfHMAF9WcQJgYBmPcsbwVY0GP2D8XJb5bUGK6DaG5U6Z
rVJlZKnyJJDFnNwyWsFK3jgpj+O13Z40mLOJejVqiKu4JHfg1Oa+1mi+qipoz29l6QW3GjbU
YVGCNElZkDQqFVlmWU6iVanxMQjlEg8abhUJV9UiKHJ5U5bkBktwpD65jEpSrlJoAPpUVxhy
REfxx7CAFugaGbOotDsx6gkYDJPJ5E9YDCucfwFsZwB8AIKWx7Y44/Rv+hFSI6FFqYPbtHxV
zcgvr0/J6ftz+L2o/0xfXx5DLPzgkrAk03rTb85CUFdI1NPmd0atE1Y/mAR+0rRw2X1Q+MCm
JjamMiwUnZqObbPqty2HC/fbN1Hfvoki376J+vZN1LdvooY2bnO2TaknHs/Z3lfN2WIrjsUw
bT/hEy3bdjzXflwT/6tq4rzYyCNs6nyCZRn9qgJt7SMcx5j2uT5hc1zfHCM+2ydsBlA84yds
jgeLJv6Mn7AZQPGMn7AZQOfrfMLm+BxWf1/wCZvj27b5Bu6LP2H7HzZ+Ri+bMAAA
--------------oAUNOWUjQdxi9r0GeJiZVJEz
Content-Type: application/gzip; name="lspci-2.gz"
Content-Disposition: attachment; filename="lspci-2.gz"
Content-Transfer-Encoding: base64

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

--------------oAUNOWUjQdxi9r0GeJiZVJEz--

