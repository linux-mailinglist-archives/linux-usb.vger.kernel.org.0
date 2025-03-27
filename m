Return-Path: <linux-usb+bounces-22227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F8A73349
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2866E177AE8
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87C0215771;
	Thu, 27 Mar 2025 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YVEZSe5c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085142144C2
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081683; cv=none; b=ftpzNRUHzpbjQM6lpe/i6zNGk5AYHOoJtj+MFVX84v+ohNslojcoIf+lkrr00Z2kNWDMHxGLpcstbVZ2Gul60JehuIrpkd+Nf6VMOuym/t6o96jq/fdQxDd4qwdeTgCp8hIOtE7OtXvHc2JA4XUieBYboxKmhaURZc8ugy2Eho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081683; c=relaxed/simple;
	bh=56dz/mSa8OE1PhuqZF2CSqQPcN2iJjWNBE27U7eZ2PE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=pT1XEXBM+mn4YsP8GmeU3LbRprWIVFowv20apjj1v0dvzfmzkcbLlJOgJqk4hXA2Hxdvs7gYfKbG6g0Y0j516NKMXVsdLAvYtzC9lBh/mWyBNy69WxgBlkEs7yqfanRAgQ9rjjGItaSJvi4wB7ralp92Gd83/cphXfGpCYt2YRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YVEZSe5c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-399676b7c41so501462f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743081679; x=1743686479; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xaChMo9saMEWy9j8nYGN/JW9wsP6SHvilPOsybpY3I=;
        b=YVEZSe5cxTC8DO7IdJ+e60OhqMgA+LCsqNLuk0t8K89xQXqceKuNEfcBADSQNR3Qj7
         tODA18Yzjo1Ck3GLw+KSex0irsJuQeq1XmKQI8pKd8EqcctAn9CuADeVUE1DLqvu5uyv
         tgiixJnRiidXeAQSQ3a3+o4AJtPUpmQ2djMs7Yw+RLYChN4kdwuXB20XvPBARVrGpEWW
         DzlkiboDX8uZ9AWjrdEM4AHc9dLsKfYFVzwL0393uOuOvsdy0nF4Jsn7kSoyEu+HxHNw
         Z5En1BKiO2C+9Qcr70WRJy1uRhNx0IXMYfSq3LxTWlI0TuibOXvlUAXTzKlgizHhEPkR
         wKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081679; x=1743686479;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7xaChMo9saMEWy9j8nYGN/JW9wsP6SHvilPOsybpY3I=;
        b=cEi58x3KSphIlTZkztkNqMs7l9tDB0d8EYGVEbiJX/2KHH6D4Xt6SCEdgY/ftZBrSs
         LuVsiEkya92bmntSYvC3h859789xxwbSpxyr5wMJwocUH8DMQaG5rLhQKJOipIXf1Xzk
         8ANRtLYJqz7uMVS019g2cqxgWrVLf/rF96c1aWLCxazbDgC05GY27R1Wh22ffbekJB78
         YXujYoDxc8TmLnNdrqFjqjAtY8iM8+ZnUyxWq4MBB631rb63fcNhL7yf9XlBN4MCeXnW
         khuCwpvWArvTuAIm1v3gx0xCWEFzZxdBI1KSGAP9LI75wklQdBJxWSppUX15WPh1rULz
         WkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUftRjU+L0brgMb3GqWclWbU++gueYLqJHfm+GuIDSK9N/CvLY2HxSOIfWzua8PrG737JCR3+FrsiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbCMcWwVP9cc10jDPUCvNOJenhhCHtoIouZzs5KlCizmjQXDQ
	XLwwki4hxQWN5r3gdtTd4LtSlj/Yxb5jW89zCDB7UfFTNq6oA6V8S2bjY/4D2/yIdF3OvAfNcxm
	I
X-Gm-Gg: ASbGnctb51ba217rJtS5t6CVn0BiNDGZadHcxR9QoFXldNOx5+i9Ha6bAZthwY9dAAj
	aUzf/UBxjIYcguup1KZJXqow6lQiC8dlnDcxrWj1FZ0BCkyVEHKjPhj9xl/71inpcfeAEAgUIAn
	l1qHNI9XpopcKActBdBH/RbIz9VYUn0MPMJCx22jeBkSXnUxdh8U9qlMTfvFE7JNNmf0sVaXtaP
	m5VJZbcD0ub+cA1avtOuwwpKu/3oiz2pBmlvlQdCGEj3+cOQSTViKyaGfkZG15Oe+TSTV7jEyw/
	PoQoOezjKNBXl6Mj+af6p+lu3ocwpM/VxbblxPMX4TWqAPyICwkI1PflHfhfQINk9uXnX4leJvi
	ClGGDQ2xBAO0=
X-Google-Smtp-Source: AGHT+IFRrSz1QKB2pd9w5EKKJ7oyHN1rVXKUiMxw0S4MZJPQy2WIbpp8uMO/fI4EVImwMrnHz2DrTQ==
X-Received: by 2002:a05:6000:2a03:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39ad20b5edfmr1844946f8f.26.1743081679221;
        Thu, 27 Mar 2025 06:21:19 -0700 (PDT)
Received: from ?IPV6:2001:a61:1394:8401:ac5f:98de:4c1b:7bf1? ([2001:a61:1394:8401:ac5f:98de:4c1b:7bf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b260fsm19622638f8f.43.2025.03.27.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 06:21:18 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Aw0jc0aBmLeCrRJ7u0mnJ0i9"
Message-ID: <42118b9b-7aa1-4559-824a-2c2ec70ea7d8@suse.com>
Date: Thu, 27 Mar 2025 14:21:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>, linux-usb@vger.kernel.org
References: <cc40e75d-1a7c-424a-8edb-3ae17bfd1462@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <cc40e75d-1a7c-424a-8edb-3ae17bfd1462@digi.com>

This is a multi-part message in MIME format.
--------------Aw0jc0aBmLeCrRJ7u0mnJ0i9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26.03.25 16:50, Robert Hodaszi wrote:

> The problem is, wdm_poll() always return with EPOLLIN even when wdm_in_callback() receives a ZLP, as it sets WDM_READ. So it makes sense for glib to think, there's a pending packet. In wdm_read(), if the packet's length is 0 (desc->length = 0) and WDM_READ is set, we reach
> 
>      if (!desc->length)
> 
> line, where it puts out another URB (as the resp_count is not 0), clear WDM_READ and go back to "retry". The second time we test WDM_READ, it is obviously not set yet, and as we are reading non-blocking, the function returns with EAGAIN.

Arguably the interrupt handler should set the flag for a readable result only
if indeed there is data in the buffer. Could you try the attached patch?

	Regards
		Oliver

--------------Aw0jc0aBmLeCrRJ7u0mnJ0i9
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-cdc-wdm-check-for-zero-length-response.patch"
Content-Disposition: attachment;
 filename="0001-usb-cdc-wdm-check-for-zero-length-response.patch"
Content-Transfer-Encoding: base64

RnJvbSA0NzMxMWUzNGNhZDFjYzEzYWI1ZDJmYmFlMjM5ZjE4OGE2ZTgyYzFkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDI3IE1hciAyMDI1IDE0OjE3OjQ1ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBjZGMtd2RtOiBjaGVjayBmb3IgemVybyBsZW5ndGggcmVzcG9uc2UKCldlIHNo
b3VsZCBub3QgaW5kaWNhdGUgdGhhdCB0aGVyZSdzIGEgcmVzcG9uc2UgaWYgd2UgaGF2ZSBu
bwpkYXRhIGluIHRoZSBidWZmZXIuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxv
bmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMK
aW5kZXggODZlZTM5ZGIwMTNmLi44NTY0ODhhN2NiNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dXNiL2NsYXNzL2NkYy13ZG0uYworKysgYi9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMK
QEAgLTIzNiw2ICsyMzYsOCBAQCBzdGF0aWMgdm9pZCB3ZG1faW5fY2FsbGJhY2soc3RydWN0
IHVyYiAqdXJiKQogCQkgKi8KIAkJc2NoZWR1bGVfd29yaygmZGVzYy0+c2VydmljZV9vdXRz
X2ludHIpOwogCX0gZWxzZSB7CisJCWlmICghZGVzYy0+bGVuZ3RoKQorCQkJZ290byBvdXQ7
CiAJCXNldF9iaXQoV0RNX1JFQUQsICZkZXNjLT5mbGFncyk7CiAJCXdha2VfdXAoJmRlc2Mt
PndhaXQpOwogCX0KLS0gCjIuNDkuMAoK

--------------Aw0jc0aBmLeCrRJ7u0mnJ0i9--

