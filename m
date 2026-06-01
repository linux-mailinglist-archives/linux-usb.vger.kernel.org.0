Return-Path: <linux-usb+bounces-38246-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMXHDdOHHWrAbQkAu9opvQ
	(envelope-from <linux-usb+bounces-38246-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:23:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7686E61FFA6
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8738E3011776
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3E4372686;
	Mon,  1 Jun 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqQ5M9Yf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FFE3A6EE6
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320104; cv=none; b=sTAgb6nhIfODGvraiKkfEujpca/ykGNQUnRxfevJEc3xgkDJrn7lKnqweuo8yTu4wNBocDZwoj5mRW++rGlVzYWc9c3z2RJFmqh2ylp46xpTAl06sAS+kmDodVu9qKnP0We+rLUybObAZDoiDjussx8melAAYH+KWrgIeEcOOi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320104; c=relaxed/simple;
	bh=qa4TKRv3TXnxrHdPXwxXTL4dL+dy0zr0l8qW1aVi8vY=;
	h=MIME-Version:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Date:Content-Type; b=Juy08BJN7B6NPdFGQT/1hDH9NGEd87GKcSqp8DIZssR7U6qGj6cCgKrVxM56Kyv/bq6upy9zKQ3ygFd9hQgxyG9TMF9tgQ3Apv8nqm+27Aq4s3R63J+VzyYu0zTXdRQ3HOPV9iXfWnoKVDP2SKAR5+ZcgAdarG2CXN+o1CQNA3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqQ5M9Yf; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1363e78746eso12830630c88.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320100; x=1780924900; darn=vger.kernel.org;
        h=content-transfer-encoding:date:message-id:references:in-reply-to
         :subject:cc:to:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUevwfcMW+V4MGFN1yutWjL1gpN3zpA2KbwhpG7X+kg=;
        b=MqQ5M9Yfo1zB2wDiZ1lIt5U+BCYJOPd3k4G2WC2dfSlB6iSR1452/9JE6Z1YPnKpNu
         aQhvr8rTyyB70KLFF518rTSO8kKAP10Tzfwj1VtuYwW0XMOe+rM7ovOm86bOioRrtL5m
         p4tBiWskU9xaASiPq4dQ4FCxDmi+EQnBpi2Tg6XAQTU0p8ynta2uYnqdPCzII4qMIHeX
         5MMGva8TisR9ooi/PFpOhGOIfAUGcFvTUKTuEjWUpKqU6isiHUrVketLDYDpnu6DpJpF
         8sk2MCCEUYU9uUljTW4fbtD/04GUYBNGS/KDBn3yo2M8Hdz0NK30yNFFnv6N15TRj7y9
         QROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320100; x=1780924900;
        h=content-transfer-encoding:date:message-id:references:in-reply-to
         :subject:cc:to:from:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUevwfcMW+V4MGFN1yutWjL1gpN3zpA2KbwhpG7X+kg=;
        b=Ztyeexa7zP8ECVrDAEB9P6izswTfTLLEPX9N7ljtn02hNE/kkvwJvwjeJ9D0ALKkPU
         ZrHrOhh4D25oBbsaV6EchZHygnMpkYVTrcfWTw53K10rtzu9nWbwP+mhdDko9C14WNCQ
         +ILv14nwU42ukpOD9cszuGqQz5w6dhkSDL8xU5/gFdUXuqVyxDTrDTm8+aaNV/3NHtul
         l7/wg6i1q3XwHyP5LsPR0pmeoN5DTHUQWwNNtBGeuqc9HJoyvl3KCKG9LkOn2PkfXejL
         po6H9sfzSBgQBQwS2V0i63y4CB7ZzUbWMpBRJy1g3+PKutCYQB/QICAp81iTBGymXzQw
         snkw==
X-Gm-Message-State: AOJu0YyJfy7L7AY465HxyX/DojxHb0fvrKOnJcfYEpZDWQWl5RGWARtW
	ff6pW15ufErEputSQDGw4RqDGWUvpFlxFWh9LaPCbhm7KCc9L5p7IEUD
X-Gm-Gg: Acq92OGHMoQimZBegQUNOB5gL4x8deyE7Nm4VJnGYF03EOKv5Ljb7fedTUkiQ/XIS2A
	8MusdHmW/cQnRoa522NNooKtnsY4OqQKEkm97xxyebFX50eHB8yE3XfpCZhg5dIBgcxN2GrCGnL
	zCmHSFT0JOYRrJUTqxvXkbR08SxInC5cFohpyFa22QTzUlW0161BVRAwi/we2mlCmUl236YMJeC
	cYYgz7cH56/7psqTyvmBa0jYulS0O9JxEVb5UHMlhFhxlQX4Jqcm5cqIRc+212BSlRqE2WWIUHg
	J/pDDqiORHS9wv5Uj0Dzb4LE1BHo+V6ki9nWacA+Bw5h4V/evday8oD15Seg6IPj5qtwr7dXavR
	f/pbdhaYiY6qnf5AXIftxwTDLGhMQ9dLFJTsYkAC/2/dznyJt+EGBVre3x7xUJtBc31xhv6chS3
	eGHg0XbdvvlJh3HtBiESUcJxd8xAlA+miOJiIa
X-Received: by 2002:a05:7022:221e:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-137d4142031mr4571986c88.15.1780320100174;
        Mon, 01 Jun 2026 06:21:40 -0700 (PDT)
Received: from GordonMsi ([24.249.245.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm6307274c88.15.2026.06.01.06.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Gordon Chen" <chengordon326@gmail.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>, 
	"Mario Limonciello" <mario.limonciello@amd.com>, 
	"Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Cc: <linux-usb@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, 
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Mathias Nyman" <mathias.nyman@intel.com>
Subject: Re: USB-audio isochronous Missed Service Errors on AMD Zen5 client (Fire
	 Range) -- Data Fabric idle C-state? No OS-level knob found
In-Reply-To: <78ebe71f-85a8-4675-aa0e-6011353dee39@linux.intel.com>
References: 18b4e4f7089aa4f1.da8dbe994ae3bb77.445e21b98b0b205b@GordonMsi 78ebe71f-85a8-4675-aa0e-6011353dee39@linux.intel.com
Message-ID: <18b4f7b23ba6392f.e25301f473da0264.54f7bc72d1817dd4@GordonMsi>
Date: Mon, 1 Jun 2026 13:21:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38246-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chengordon326@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 7686E61FFA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mathias, and Mario / Shyam,

Thanks Mathias -- the LTR/LTC angle is very helpful. It points at exactly
the kind of "tell the fabric to stay awake for this stream" mechanism I was
looking for, without having to burn memory bandwidth.

Following your pointer I read the capability registers via debugfs (reg-cap)
on the controller the device sits behind (0000:6b:00.3):

    HCCPARAMS1 = 0x0120ffc5   ->  bit 6 (LTC) = 1

So this xHC does advertise the Latency Tolerance Messaging Capability.

One constraint rules out the first path you described, though: the device
(Behringer Flow 8) is a USB 2.0 high-speed device -- speed = 480 Mbps,
bcdUSB 2.00, no BOS descriptor and no LTM support advertised. It therefore
never emits USB3 LTM messages, so there is nothing for the xHC to aggregate
from the device side, and I'd expect it to forward a permissive (large)
tolerance upstream by default -- which would let the fabric idle freely.

That leaves the second path you mentioned: the driver injecting a custom
latency value that the xHC factors into the shortest-tolerated-latency it
forwards. Since the xhci driver doesn't implement that yet, a few questions
before I hack a PoC together:

  - Which mechanism in the spec does this map to (4.13.x)? Is it a value the
    driver writes to a register / context that the xHC then uses for its
    upstream LTR, or is it per-device / per-endpoint? A pointer to the exact
    field would save me a lot of guessing.

  - Is there any in-tree precedent or WIP I should base the PoC on?

I'm happy to write and test it -- I have a 1:1 reproducer (count short OUT
URBs while playing audio), so I can tell immediately whether forcing a small
tolerance makes the missed-service events disappear.

And for Mario / Shyam, the other half of the chain: assuming the xHC does
forward a small latency tolerance upstream as a PCIe LTR message, does the
AMD client SoC's Data Fabric honor PCIe LTR to constrain its idle / DF
C-state entry? Or is DF idle gating independent of PCIe LTR on these parts?
That determines whether the whole approach can work at all -- the xHCI side
can express the requirement, but only if the fabric acts on it.

(As a lighter-weight variant I'm also looking at whether writing an
aggressive LTR value directly at the PCIe layer for the xHC function has any
effect -- but that hinges on the same does-DF-honor-LTR question.)

Thanks again,
Gordon Chen

