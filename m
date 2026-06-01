Return-Path: <linux-usb+bounces-38252-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCNoGDWPHWrFbwkAu9opvQ
	(envelope-from <linux-usb+bounces-38252-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:55:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B5620596
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F5EF30C3945
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01BC3ACF16;
	Mon,  1 Jun 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyW67PUj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C993AC0FA
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321470; cv=none; b=PHrqYJesOjhZCvf9gQ55NKgTHOZdTEAE6DFaovh8kDRpV0PfSftNjSQGk+8DgKC3GHq21f4uNxho+1Rc7SnCk7kJZxRjctwYdTCh6yN9IxYVwCCXt8UO385taLpAXzLjJd8IsbgbXlSMu3wyCl45H2ygwlD62dqXWeVF2YYgHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321470; c=relaxed/simple;
	bh=G0GDCGBDBmBtWPYbM6yoLHhxE+ZZhx54r0Gt1ypGkpo=;
	h=MIME-Version:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Date:Content-Type; b=WAjwz0AkydDFrjaAczFz0qosUEOkUyuwpnqIRRsyPH70+1ewA++CD/s4SZ51CdoqmO9LJU+9a9M+4C7O+W4YDNqP56ZlxgKxYK5vyrLPZ3sZlzCOo4Eg5LxMHR4IHAIOmPsEM5wl7cr6rPtImxLAe6NFjwwRN7fskIhwBWlB8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyW67PUj; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137e3a3a4b0so1858828c88.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 06:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780321468; x=1780926268; darn=vger.kernel.org;
        h=content-transfer-encoding:date:message-id:references:in-reply-to
         :subject:cc:to:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp5vSMppXoItqHAagwaAVQcBt6Js0Wroa25cfHyXfxo=;
        b=XyW67PUjtyqto6qCn3/7KpC+Xj8GtmSnUeZt5wQrV2t2acMzBglkdeBgYZ5UAUQFbS
         LLoIpBbA3IF65WEU3kZP5g6Lkwm5zVzcVVHGesFdlz4iMW38/9nujR61y0YXlGXuROed
         12Ill5JuV6C2XfCUGx24g/Rsf/fW7zQfg3GfQa6F3A4CIRyTXn1MqKksTtpXp8w5lcFH
         j+KLMltqY1U4cYQPOa3qXLY/oDmLugxuu12agzxBmATSo/2eK8954tGyWt5xAefw5sGI
         zrqaEUFWkQKiUAta7j+xdKJ2KdzdNVVqowuTVKjv9DmQFHLIYv7uzJvcs7SXEdvXwLo3
         5Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321468; x=1780926268;
        h=content-transfer-encoding:date:message-id:references:in-reply-to
         :subject:cc:to:from:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp5vSMppXoItqHAagwaAVQcBt6Js0Wroa25cfHyXfxo=;
        b=P5RxRqolc+DWpn72CmaMDNok2ZDosr+Za7joSkho9BduXtYp1Gr35UzFAHbVaDumlr
         j+JsAs8qbHRRXEciNbh9MDunuWO2lIoubZWSNROLmXP4MleI6XrtdMOTJJHcUWOPWjRw
         Bx9bwnWbHDLgBxXPoinc3RZlbDlDYQk25YieH8qnbdKeZnvTIzBeo1I9HGd3qql/PS7H
         R2VSkKylaEOGi+eVmvUMZHsizdfsB/3eThM9W/JIezFfn1wC1QrwhlK0/Zwvv2RmO97E
         hVpEjQ7/JVu1Qs3mjJ3Bo3/AfMKN4ButzsRdCJeB6N31lTavSI5csSRu7d4pZbc185md
         qZTg==
X-Gm-Message-State: AOJu0Yw+8nN92WBodWobAb5FY0IMFbccG1cVEigqDWr/Ugd6MH/PA1LE
	nTkWffki2AkOUW3s/vZ+fr7FxT7RPLH//VRO3EG0z8W/v21z/xQyOcwB
X-Gm-Gg: Acq92OG4mpPNQoYynRMApIhp6ScILaEb0H96d8d2VYBsD7Y3dOLoKuTH+U8f0u/2H9f
	Pn+Sj8O/NbbAvPnAxe/fH+P3rziTMr9SewcBsxpdJtADhkOnKDkMk+IoCbpzXt2IdI92yLhJAIF
	ElhrNn8TeO40KvOTY4vo1Uso0qoIOKb0M5pzH7QCOmP68T+wIimY81mP+eoRTFRpkkFMuxNUJux
	l+GHkpef9sOFmrMC19QS2rqNVH6jEqoa6iM72JPDhk28tO3NHg3ffo6euWeAFO0MO+Qa/qtlxRH
	DyiIcUgT2xDchJSkw4BWTtavT9wdeZMpwp6Zwi7b+pvafrh2MI/sncScav766MxVQe07Tj4IkfH
	DgMUXMNNcfMbO84cgNgi5YgFi7U/A4Rad7IrV1LL3HX/Oih8rN4qcV2KQabTaLEu6x/uwCR4qNq
	ErSOd6xscms/MqeiHslDt6ysVAMY1SNMDo3xTs
X-Received: by 2002:a05:7022:6896:b0:133:1be4:a357 with SMTP id a92af1059eb24-137d3f18cb7mr4397728c88.1.1780321468166;
        Mon, 01 Jun 2026 06:44:28 -0700 (PDT)
Received: from GordonMsi ([24.249.245.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c7fd47sm7323475c88.14.2026.06.01.06.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:44:27 -0700 (PDT)
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
In-Reply-To: <18b4f7b23ba6392f.e25301f473da0264.54f7bc72d1817dd4@GordonMsi>
References: 18b4e4f7089aa4f1.da8dbe994ae3bb77.445e21b98b0b205b@GordonMsi 78ebe71f-85a8-4675-aa0e-6011353dee39@linux.intel.com
	 18b4f7b23ba6392f.e25301f473da0264.54f7bc72d1817dd4@GordonMsi
Message-ID: <18b4f8f0c2ce37be.8d4c4c4ee804b95a.4c2042ec04b99872@GordonMsi>
Date: Mon, 1 Jun 2026 13:44:25 +0000
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
	TAGGED_FROM(0.00)[bounces-38252-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: F05B5620596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

A quick correction and a sharper question after probing the PCIe side.

I checked the controller's PCIe config (lspci -vvv): the xHC function
(0000:6b:00.3) has no Latency Tolerance Reporting extended capability at all
and reports DevCap2 LTR-. Its upstream root port (00:08.1) is LTR- as well.
So the PCIe-layer variant I floated in my last mail is a dead end -- there
is no LTR register to write, and neither the endpoint nor the root port
advertises the mechanism.

That leaves an apparent contradiction I'd appreciate help squaring:

  - USB/xHCI layer: HCCPARAMS1 LTC = 1 (the controller advertises Latency
    Tolerance Messaging Capability).
  - PCIe layer: the same function is LTR- (no LTR capability at all).

So if I issue a Set LTV command (the driver-injected path you mentioned),
where does the xHC actually forward that aggregated tolerance value to the
fabric, given it has no PCIe LTR egress? Is there an internal sideband path
to the DF on these integrated AMD controllers, or does LTC only affect USB
link power states on this silicon -- in which case Set LTV would never reach
the Data Fabric?

If it's an internal/sideband path (Mario / Shyam?), a Set LTV PoC is still
worth trying. If LTC is purely USB-link-scoped here, it won't touch the DF
idle problem and I should look elsewhere. That distinction decides whether I
write the PoC at all.

Thanks,
Gordon Chen

