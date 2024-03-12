Return-Path: <linux-usb+bounces-7874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40F87917C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 10:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE6C31C21501
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACDB78291;
	Tue, 12 Mar 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbpHIKb/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A28464
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710237243; cv=none; b=rgTV+3wNiZoatCH2cHBrDuk8cdjnWhj+c2aM/hR/LFplBRWqnXlEOCRIqguXXm3ciULmlsOHIPVQkePi8vpXELNKUmAJtX+NOi8tyPRRDB6g1+OXsg2FvyrQwwGhW/A6eelU4iw8omHmYRCtNVLwXJbf/1GJjLMqUFKOKaMiKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710237243; c=relaxed/simple;
	bh=1wpswgVZqkISz3/6V7dEeFQ9rPXFDarbza0ZUDE/0po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bO8fU4gMPcXz1i9jL0gQMCpl0gRCUqbG1UlbvTMObpihEMO/cUkPsgGgKb6vOHuyBwj5tMkkoEVDv8ZqpkWWBJgBly1BoN99BQyIE+Qpr/Z8281vHN9+kxrRwgaks4OarDOwW2CGZPZF8Gf0EgprGY4hvcjdcrpKEmu2TrQ776c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbpHIKb/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a446b5a08f0so951549566b.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710237240; x=1710842040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=09XCEFaluQvJ7f+PeaEZJQSdlEsIPQLn4Tj5vGYtxuk=;
        b=FbpHIKb/2xXDJcbOyTYjqxnmtcR0Jk08EyIQxRZ8+cLzdRl5H06zGb7JdeZVDIPh3T
         rEIWR+BQJL30Fbb3bB3Apzep3sYskGRSUU9lG0zZHhpRmrog908agFfGpOKhfxZ7gzmC
         XSBNZkGvIyBMgWN3JsEozS2GTsU8btP5+P4t7Aa35XDKuMIoi6y9+I0uwSLYaTl2/2ER
         Q9PTOYyJR/eTuJurh+zfcW0FDlDT6JMszdabQHRIMIK7xmTREPOJ7SFErWOSL77p++uf
         49LPCevybE6ER4GyASTEZMy+3Q319ICxMYfTEtuAYF2I8fBeOC+layJNpzmHQVqlayHw
         Tnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710237240; x=1710842040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09XCEFaluQvJ7f+PeaEZJQSdlEsIPQLn4Tj5vGYtxuk=;
        b=MXmh723lry5SWDfGhLMmh5A/1biKaOQ0NXIt+KHt4QXGZRM2AUYJAvNxX796OwWgag
         RgJ4qi64+KJhlfoBSz7RyNzxNDVdUHF2zuG+vlw+ufFtqGJHOIV+0pzMgoo89oVv8Wkc
         2faPSYw3IeCSnhZUX2+egL00Hxj5msjbwRUXqgu+kUZlsk+X+khOGBe9hi02Jy7L2n/O
         d5rzKVa6vvpWb1UPg0kYk3zuf6uuX9SL2WxrK4YQjSPvDLKU9mi5OD1V2/RttZcjcb4E
         AvMafbvgB56cgxBXfNPjAsvyroWVhATCqIFMNWQpHPpDhmf8YQ6OXrbgO6VoOz1i9+oP
         XWtA==
X-Forwarded-Encrypted: i=1; AJvYcCWqDnzXRxamY/XzwZZ0vFrtW0gfvKfX5bZBSMrNXaauWf0Q2UzRvVfnJLLDeFTCg2I0QKyFSO38AurUai37cRkelTntr5t8j1Vs
X-Gm-Message-State: AOJu0Yxq4N5lzIz0moS22CEE5fty6+lxCNs2G2UxJF8aiVsl6YNhLbRl
	9udKiCH3crOdwBpJsr4m0ygDl46pX3Vi2/pjjrSwWzq86mxQ+AUvO/vcH1JB1LvXBJPYEBk46qr
	KL4cCO/cFJtv2rspz036h4610DxMh+8NvSvo=
X-Google-Smtp-Source: AGHT+IFkBL6rKKzxn4c7AT8Ng0LJ7W7nozjn/bQojICxxDVWwHMfiIreKz1Jgvb5RNihxR8NgY05996txp8QwcpCUJg=
X-Received: by 2002:a17:907:d049:b0:a46:301:dd98 with SMTP id
 vb9-20020a170907d04900b00a460301dd98mr7439090ejc.13.1710237240048; Tue, 12
 Mar 2024 02:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-2-alexhenrie24@gmail.com> <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
In-Reply-To: <ZfAGpkMT-jaZGXmF@hovoldconsulting.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 12 Mar 2024 09:53:23 +0000
Message-ID: <CADVatmPE7++_XN9m5jviLd0kKCA3L3GacAFAB8DVgY3j5hxjCA@mail.gmail.com>
Subject: Re: [PATCH 2/7] usb: serial: mos7720: don't advertise PARPORT_MODE_PCSPP
To: Johan Hovold <johan@kernel.org>
Cc: Alex Henrie <alexhenrie24@gmail.com>, linux-parport@lists.infradead.org, 
	linux-usb@vger.kernel.org, daniel@gimpelevich.san-francisco.ca.us, 
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 07:39, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Mar 11, 2024 at 11:50:27PM -0600, Alex Henrie wrote:
>
> This one and at least one of the later ones are also missing commit
> messages. Please fix in a v2.

It will be a NACK from me.

This patch and other patches removing PARPORT_MODE_PCSPP will break
userspace code.
On my system, I have:
$ cat /proc/sys/dev/parport/parport0/modes
PCSPP,TRISTATE

If the flag is removed then I will only get "TRISTATE", and if there
is any userspace code which checks for the mode then those
applications will stop working with an error.


-- 
Regards
Sudip

