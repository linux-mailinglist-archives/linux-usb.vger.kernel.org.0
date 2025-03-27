Return-Path: <linux-usb+bounces-22228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551AA73351
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B9DB189892C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085D62153E7;
	Thu, 27 Mar 2025 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XdHrV6sd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F0215046
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081898; cv=none; b=eezDpkb4f7K83WHuCloThRG9CpljO4HImDon9h9XYAK8clLvQpHbjUQPomocoKPegS1W0CPPGcXxWuFLNXZFTEwk+sRNKEkpwSJw/k+ymXJHpXDYRpGI7fbrq3IdjHUjXLeaLO41EWYExI9woT90WqvChlLyxFdfYIwFNAbEwQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081898; c=relaxed/simple;
	bh=7/aQmWJ/aEQ0i7pVALQ93UWzS6HaarBQonoRQHCECm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NYssA2Fv+PEk+v7CCMMsfOSk36JaK1aSFz5ERXpi37qXH/oaHfc8OrYyB5VcCp8hN6x6yRN5BN2D2+07qQksJX0Lzo6Bgt3qmBhmhIzr6SIAx5VbSfjMhGH29mPY/P+Hj0higwoMt9BguUDpmlxlfdQy0Q3jFyWt87mEf4YkEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XdHrV6sd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac9aea656so796397f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743081895; x=1743686695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Enud65LRoYCT4bIbMN1ZQWj/iGlQW9nYDDAkaw6ZO9Y=;
        b=XdHrV6sdwoVF2Bjqz/h0GQFSXJ4M52PHYumPUKT8VLCewuyqQCUTywkvpqQF2X06pN
         txnwla0BQs3KRqoL0C66KLXm1qyMHN3xlc0QUWj8OXBJDwcuEUWNxCM8676tU5FxbrGZ
         le41DVXfqZxUxU+uBKbCx8THKpPBNz3deJdiKKlgqeIbtWY3soeU7hMuKz/nc0hTNmCy
         Gt9YApuneIdGeL02Esw5j+Jr13KCYP47sQlVdmkbU4uBhhPoXC38JJOpvCqHV5aiXwjx
         68/8QDMcP8B5PZ0SQvUt/ew6zqODMp6fwbF2MJNA3WlvaBpA2lt8y0URhm4E7bCS1X1/
         O8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081895; x=1743686695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Enud65LRoYCT4bIbMN1ZQWj/iGlQW9nYDDAkaw6ZO9Y=;
        b=FVeBiCFl6hfGZSiRqWhZD34s8Icy064NFoLpZ+YVc3p4gomOdZLYZ1JZCypzJ8+Keg
         DM97u87JI4Si0LPeyZDfM/ajYXf1dcnN4t3/oDQEtl9AX6cPKR6oBLXzz6jqjcR3xuSE
         r0+dgWAqfHDZeu6yH7/L1/95c5NQVvUJx+vd54IFyzFrf4lXY+AT8OxCnDBkEe0ZOP6p
         TSJssZb1xHCEoDqMAi3qZzqj3NSIZK3RGu6Q/3Jf82JK1ZPKSwKmmDIcMEqggoj22xUA
         Yo7qIdvHIv736D1WZ19Mp/ood1YHXTcVkRclAv9jm55U3qB3QSFxOCTFR64SaXfuuDpo
         qviw==
X-Forwarded-Encrypted: i=1; AJvYcCXTgj1IZ2zRWA+7eHAEeYbb5/89unRGw0i1RyFe6jPUWD3wPmnJ9I5OFQ0YF0UwIkjBRgH+N+KiQ0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHhErg422kDvP7fQy5zM2w6NhdboyXDkPk9wyWFL2YDnz1o2f
	IpNISoLoxZ6huv5UR81uZXx42S+tgp/M9NHJlUimD/4tTolaLDTwy0tL7EgTOawC2BglV5l5WZm
	o
X-Gm-Gg: ASbGncuTYx9wJrdqNVmHYh/wvyNQ5+zblVq4OBTSoI4znNn+CN8eV4R+A3eJHi3h8iS
	w6OqZ1N8N9wuMbpU24dtsz3l+1TUYB8Vqa9yHSHgKiB2vi63GoDkTTt3SoqeRNpxjcQqGRdvwCh
	ujVt07yIoigv26B51QMH05pNdMuWk835VOm3qyY4ze9Z3Zmp+SNzzvSu8qI1PwN3Kvax/MWZRdl
	fk01nqhYyDSvGhZ6N5omp1Y58o5Se52GbPKBPfdJDgoi5J3rNIH4QiIfvg2Yn6yonXrbsYV1hLq
	mEDHc2/zPDf/N5h+lAXzSkpNTi3RBZ8Jo+kizxwzs4FDE3N/vGNihCucn3B7NaOfID7yShdpMY7
	YGeB/iNa2aCE=
X-Google-Smtp-Source: AGHT+IHwDb/o1T6zhA103lumqb1BG2OxrFwxbBgUZ8DsuTv5ZqkSMVxuKXZWYii0JlJL/ilmdEOItg==
X-Received: by 2002:a5d:64c6:0:b0:399:737f:4e02 with SMTP id ffacd0b85a97d-39ad178dae1mr2937056f8f.39.1743081894606;
        Thu, 27 Mar 2025 06:24:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:1394:8401:ac5f:98de:4c1b:7bf1? ([2001:a61:1394:8401:ac5f:98de:4c1b:7bf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82deddd9sm37954415e9.7.2025.03.27.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 06:24:54 -0700 (PDT)
Message-ID: <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
Date: Thu, 27 Mar 2025 14:24:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27.03.25 14:01, Robert Hodaszi wrote:

>>
> Following on this: returning 0 bytes for read would kill libqmi, as that handles that as an error as well ("connection broken").
> 
> So what about this patch?
> 
>      diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
>      index 86ee39db013f..37873acd18f4 100644
>      --- a/drivers/usb/class/cdc-wdm.c
>      +++ b/drivers/usb/class/cdc-wdm.c
>      @@ -214,6 +214,11 @@ static void wdm_in_callback(struct urb *urb)
>              if (desc->rerr == 0 && status != -EPIPE)
>                      desc->rerr = status;
>       
>      +       if (length == 0) {
>      +               dev_dbg(&desc->intf->dev, "received ZLP\n");
>      +               goto skip_error;
>      +       }
>      +
>              if (length + desc->length > desc->wMaxCommand) {
>                      /* The buffer would overflow */
>                      set_bit(WDM_OVERFLOW, &desc->flags);
>      @@ -227,10 +232,10 @@ static void wdm_in_callback(struct urb *urb)
>              }
>       skip_error:
>       
>      -       if (desc->rerr) {
>      +       if (desc->rerr || length == 0) {
>                      /*
>      -                * Since there was an error, userspace may decide to not read
>      -                * any data after poll'ing.
>      +                * If there was a ZLP or an error, userspace may decide to not
>      +                * read any data after poll'ing.
>                       * We should respond to further attempts from the device to send
>                       * data, so that we can get unstuck.
>                       */

Why do you wish to react to this like an error?
It seems to me that we indeed need to wait for the device in this case.

	Regards
		Oliver


