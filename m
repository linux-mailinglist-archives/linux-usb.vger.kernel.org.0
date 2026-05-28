Return-Path: <linux-usb+bounces-38141-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCVOH2K+GGoumwgAu9opvQ
	(envelope-from <linux-usb+bounces-38141-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 00:14:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D15FADA2
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 00:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48BC3306DAE5
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 22:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B461368D4D;
	Thu, 28 May 2026 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgT1QUx3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E032B117
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006264; cv=none; b=ArFksWBUDXyf0EoJSO2DbAbm4u3fiBZxKAMAyNIpMshnGjdHpnvYrkCCLATnvy4ojMieTTwUGbyNysDUAYm/F5o5cPk4MOsZ/erUl8Fj266d0SnFgyjQTHJ0pXhBJjsIcZdX5tDws4dE21q8nld6cdejQbSX5w3MxfyFiRlouJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006264; c=relaxed/simple;
	bh=DGQlZzfssOX99vNzu1Xrh4D4DC+p/7wHig/0ImZb43o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJsoYOhyG1lpaLnTnHkXsVqk9vnkV2qlBnCS1b2g+6NxbTx49g/17gFhZCNcbACkOgep4V/UNeqgUeVH4aSIEindZSQGaGGJvn94UgdIyPm6x6hNuzXpw8pTEHfRCvRGk6sdIiPyF4Pcvwp5r24HpAzDBToB4tsSiVdJkZGhG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgT1QUx3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso74313735e9.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780006261; x=1780611061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg6BSobeNvsNJR+oWbrlehbJn55vmiFPSfAxhCS7ti8=;
        b=VgT1QUx38Ch3t4tpF0OAF6yZGER/VHMM1lXyppXsN3UCmdxp+LQDcLj8H4ykRW/VFd
         vugZ+fKwb1iYz3q5sK4H6X47RONhQ3CZnnrYGfAcjCvqtyIspU6BZdH6LAMrKemyrPSG
         yx7J0Uuh0bfyxFQ5zB+GMeD/zsSDtG4+hceCk2n/mUMRWfV7CuIVLpeB1eqE5ulYaxyQ
         kT186ib1wq4EQ1o+zdyciMzciTYh5G3u08vQkGVIRHyOuN3/kRmb9dz5FS0ly46jr65N
         uf7rqszIWtea81gRTj43ihquYAQeHoVxzLc13+fyRloRA2Een9lqautKo4w+eQESnETF
         s0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780006261; x=1780611061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dg6BSobeNvsNJR+oWbrlehbJn55vmiFPSfAxhCS7ti8=;
        b=IkU/bxTc4mjyL17tAm6Mzw2YzWNPEhaVBZsO0QKjZpHKTY2I+UPlwheBr/TPvwTJHr
         sUMnwtwEfEn5adF9ntSBAx4ETgIlZadvvrJnz0Lae/ae/qmqgmuXemTjC0LXIj1LAgPP
         wNYCD9/jAWJ1DclJ/eVilACe/owzJiES0UNlD5k+1cy9EIulhkk/zYE0ok66A6zyiLT4
         Un9fIf16bkLUXhkgY9sGfk5hpKUFT1vgppoDibxSs+ixOy1lvEamPmJtU7zraGJFpK8v
         ScVXpMeGrEFDKUWydVjFgwZM9y3muiLPY73/UY7H2sqsa1GSN7LnqyHyTXcjSJ3S9mLF
         kJ5g==
X-Forwarded-Encrypted: i=1; AFNElJ9HGmxlbacY7FHabtqUAPeupYBgVFpIoebOJq8VSbdoy5BzsXAvFVWai1b8/k2bh3yfrPzR02rg4Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoWRajm0absZnqT9hC6bnNCzJt379rf4Vxu36KvqZ3ffRdvt60
	XZA8x1ZsmfSSBrG4H8d8ZgIX05EO32LA2menCPaYjdHV+HfnUlfSEpJinsUY0g==
X-Gm-Gg: Acq92OGRcjlpc3g17axspN9/1eP4zAdQkd0V6emn3ZXw+oId1bdv1DUGdjtlMey3sff
	Axvn0TWbD1oGDOf1/g/eAxXA5UNHrHiH4FXF3vG+fBfB2Vz8eoKvnUZm1ZNY1EogrsFZSLvnT5v
	ZR5NPPzXvL4J/2M66QnkVbLh7dK5Mj4PgQkt2E5VkriNg7vtoua8196vKeTS9TfQ+hSbuPrOFTB
	B3CTJ8GEYX/iryGsC4vvECvH8GtjcCxMX888JFc13FwtmwB+T5ScT5xqE5seF+cgiIAGYCMjd5q
	cnbaeGx7afifCtS2sRX+NSNQCFSINuy0eRAZd8fX73IJV6iAXqdkejNR8SHst4H+WvvHStWEbFN
	EkAKUBG5N2pi1qyfYaeW2Sv0hbvM/zAM9WcAulhPqEcNOrcXtnDjN4v3VQqX0/VnHe11C22md/n
	7OypYRMit22/VBvUzhk2JSgF1K07uChJgapCDmBegqM+tBtA==
X-Received: by 2002:a05:600c:a21b:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-4909c0892b5mr3048625e9.11.1780006260813;
        Thu, 28 May 2026 15:11:00 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c77sm2232645e9.1.2026.05.28.15.11.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 28 May 2026 15:11:00 -0700 (PDT)
Date: Fri, 29 May 2026 00:10:57 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260529001057.1e0403c4.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
	<20260404152438.582f0451.michal.pecio@gmail.com>
	<CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
	<20260509180603.6f67c9d8.michal.pecio@gmail.com>
	<CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
	<20260512120334.4eef3d0b.michal.pecio@gmail.com>
	<fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
	<CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38141-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1C0D15FADA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 12:52:16 +0100, Martin Alderson wrote:
> Caught a fresh failure on kernel 7.0.9-205.fc44.x86_64 with xhci_hcd.dyndbg=+p:
> 
> Timeline (single suspend cycle):
> 
>   11:09:45  xhci_suspend: stopping usb1/3/5 port polling
>   11:09:50  xhci_hcd 0000:0f:00.0: xHCI host not responding to stop
> endpoint command
>   11:09:50  xhci_hcd 0000:0f:00.0: xHCI host controller not
> responding, assume dead
>   11:09:50  xhci_hcd 0000:0f:00.0: HC died; cleaning up
>   11:09:52  xhci_hcd 0000:0e:00.3: port resume event for port 1
> (keyboard wake)
> 
> 5-second gap between suspend start and HC died - the stop endpoint
> timeout you predicted.
> 
> Command ring state at death:
> 
>   0xffffe070: Stop Ring Command: slot 1 sp 1 ep 1 flags C   (completed)
>   0xffffe080: Stop Ring Command: slot 1 sp 0 ep 1 flags C   <- dequeue (stuck)

That's odd, I wouldn't expect further Stop EP commands for the same
endpoint after one with the SP flag. Not until the USB device resumes.
Mathias may have guessed right that there is some unexpected activity
concurrently with suspend.

>   0xffffe090: empty                                          <- enqueue
> 
>   enqueue - dequeue = 1 TRB pending
>   USBCMD = 0x0   USBSTS = 0x1 (HCHalted)
>   port01 portsc = 0x663  Link=U3 CCS PP PED
> 
> 
> I have the full snapshot: command-ring/event-ring TRB dumps, all xhci
> debugfs registers, dmesg with full dyndbg trace, and the kernel
> journal for the cycle. I'm not sure the best way to send it though if
> you need it?

I suppose the debugfs zip isn't very large so an attachment would be
fine, plus another attachment with dmesg from the beginning of suspend
attempt, or complete dmesg if it doesn't exceed a few MB. Preferably
with sub-second resolution timestamps, if you have them.

Regards,
Michal

