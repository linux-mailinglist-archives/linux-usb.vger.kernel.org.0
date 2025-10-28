Return-Path: <linux-usb+bounces-29787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC6C152F4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7924C1B23B06
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F4125A633;
	Tue, 28 Oct 2025 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fuNB6Cs4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D88244686
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662087; cv=none; b=hmN4MZ5IMWhvK6O+mzgPXPo46N7E0xT9rG1TqL3sLWBfVwNYKbpZafgTadRs9dEZFGb+e+zFgrmFa8GerkxoERtMW9y4YrEmIWTK1ad35+7M6/UNGx+ha+mp6mV8I7uz3S+LA8DlEr23g7Cax1EV/Lr/5u3EJscwyUh1BtV93OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662087; c=relaxed/simple;
	bh=IrIwE9h7DR8qHV9wXzsI9oVHhI/y5M3c+4yptWNilwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uamRVtMMURWXhiX/tt49I6hLnhq2k2mpdkZw6wawKOXT+E770MVpSzsBDl4l2griZEQ0qgCZWzef+d7e1GPwB8hubOvoM/hITY8M27MT4jCEVR7tPTtmsZRc+hYV0wJ6A9se3dFEVU0bnAE5vKYlXxKy+aR5+/Rh6+F8je8apM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fuNB6Cs4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d402422c2so1408266266b.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761662083; x=1762266883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1SwvZmEB6+g3bbVZWOOgFmOgcwd6lOAGZdFxhABCSI=;
        b=fuNB6Cs4wnmf82HeKFf1hkTxPRizKc5dPgLvL3zyKcu1DGUs2JLdvpyNIZZIBETZR5
         V80WM2enM9UNOn7Fh/gB7nK3jWQcy8FYbYzj90EIzGl0d24J5G41sIL6xVhhPoiIQLgL
         fHywwxct2SOPAwhM+AgfhrwEeoEIvSxeCd6JDKh6F0oOYSYrIJ4wxkyMA8T1duCDt9yC
         bXBPWGjRayfOXQL5G2Vpw5Ceh06EyqchaGNFpbE3o0j3mlBIrYDDdB+EJzq3hRD4bBsH
         Zir/Sx56WCFqvayQ4VIo6W4PvTLvsL3PUW/w+ViCBODiuqyhSJk0f8wCuRMtC9l40Y5A
         jVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662083; x=1762266883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1SwvZmEB6+g3bbVZWOOgFmOgcwd6lOAGZdFxhABCSI=;
        b=sWyZS/th+wVEfkaqaLju5aeayY4nGe6X1mHp5N/dFzAZ5W3ZPx8oy/anVSuR0+3sVm
         AKyLT66jt/O4zdMpmv17AM2J36C1u/Yk2Txzb9PVTVNS6iIOi2KdQ1hxnG2th1VdHtcj
         Mw4Klvxe78KGRyyhJszPwEp00dYS6AxA7R5vjLBNOginb1/KWbyX0kH4/qQQruuc1i9M
         ak9wuRCWpRwonjdmynDq69iw1pz52nG9rTki9gFLA3i16v+wRpBUcIvyfiwLy466Vc6j
         j4OfiNJGAIjqccxhyE9NG+rJn1m2XVEzxA+uSlJBFSVfDuiWENZzofFs54sZfsZF+GUB
         miXg==
X-Gm-Message-State: AOJu0Ywy48lq8ZFawjX7TtTDazgmfQaLWOiaqj3SgFHjzfFYL6RUaAIN
	2NAq5TUkc+dVer1OkSL8hUJ6ZuCM1ej09hrMCBbqHQ3DfP4yW7I8WS3W7dpPuxB+veQ=
X-Gm-Gg: ASbGncuAhbkFRPSepN6B8Uc5B32z55wdx0NxXH09lHUfSXMARRICZvh6UsoR+6rfEMA
	GqILWbZTM7CKtFYkvTNJ87bDIz+qHUCILD5RooIAIp74kjvBHORgyl/8G3x6Dv74ImXvE96fYbB
	vlzXg2l3/NwMf6kxhUxi13f1pbcn6TdtcaeZyZx1/+uQxwX5o5+CqzQqWRqHnC6uLKms2Svp6Xf
	3zyh7ZEXYzNfVnOfugl5NU5/TXUmyqkSaEV7zx2zVvO46mpbEi8jyG8R0mjOsnuINdKqwQuuk9L
	bGbeIqlfK3mHeavEHu2h2eib+gqfUAW96/KAKmzfsCIrqqs88j4j85zE2vt893WckSCeo2JF8TV
	T7TsFBBHOYYhYzMCpJQ/qzniTZQAkpT8S3A0NoEM/CQTGROCPIr0ncTGvtfzHi+hWIU7sJTvs43
	8jds2bSuhd
X-Google-Smtp-Source: AGHT+IFETOfvhm9FiU+eJ3ibQ0E7KKfRtinwOMtbekWU8bFMV5ivyYpSqvWeNgtH7wNEk5vYIJvblA==
X-Received: by 2002:a17:906:46cd:b0:b6d:bb1b:c505 with SMTP id a640c23a62f3a-b6dbb1bc5aemr244815066b.8.1761662081993;
        Tue, 28 Oct 2025 07:34:41 -0700 (PDT)
Received: from [10.191.11.109] ([81.95.8.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541fc31sm1115541266b.60.2025.10.28.07.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:34:41 -0700 (PDT)
Message-ID: <16a3c8ef-dd3f-48c4-afcd-42ab4b14c429@suse.com>
Date: Tue, 28 Oct 2025 15:34:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] uapi: cdc.h: cleanly provide for more interfaces and
 countries
To: Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
References: <20251028123254.1888303-1-oneukum@suse.com>
 <2025102858-doorframe-canola-e6c0@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025102858-doorframe-canola-e6c0@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28.10.25 14:32, Greg KH wrote:
> On Tue, Oct 28, 2025 at 01:32:22PM +0100, Oliver Neukum wrote:
>> The spec requires at least one interface respectively country.
>> It allows multiple ones. This needs to be clearly said in the UAPI.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>> ---
>>   include/uapi/linux/usb/cdc.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
>> index 1924cf665448..5fcbce0be133 100644
>> --- a/include/uapi/linux/usb/cdc.h
>> +++ b/include/uapi/linux/usb/cdc.h
>> @@ -105,7 +105,7 @@ struct usb_cdc_union_desc {
>>   
>>   	__u8	bMasterInterface0;
>>   	__u8	bSlaveInterface0;
>> -	/* ... and there could be other slave interfaces */
>> +	__u8	bSlaveInterfaces[];
> 
> Can this be combined with bSlaveInterface0?  Feels odd to have 0 and
> then "more".

I am afraid the C language does not allow you to specify
that an array must have a minimum length other than zero.
In this case bSlaveInterface0 must be present.
I don't think using only an array would be the right choice.
> Also, what determines how many, the overall length?

bLength - 4 is the number of slave interfaces, which
must at least be 1.
We cannot use counted_by in UAPI, can we?

	Regards
		Oliver



