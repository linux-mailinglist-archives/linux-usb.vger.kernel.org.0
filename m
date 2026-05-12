Return-Path: <linux-usb+bounces-37348-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOBAK25dA2qp5QEAu9opvQ
	(envelope-from <linux-usb+bounces-37348-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 19:03:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0365255CB
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 19:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4B6B3086A2D
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 17:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C553D7A1C;
	Tue, 12 May 2026 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd5gA4pF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26592C08BB
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605333; cv=none; b=VhadRr3g4vvpY4RBhsOD099DxzQSnIKNbxwIrfS6ch74MyL6H9EbwHFT772/+hsBRrSUSMHl99HE6kuW6mjl1fZsD1iUQ3LOb3uuhv+f0Gve/im2Bf+JDJP/A+T2eeGkqXDRj5+wyclPGGIc6TDl/RDAV1U7gHkQEQGPsI+emZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605333; c=relaxed/simple;
	bh=dr+pzQEqon8oeGgiqLOPXlJpU24/XSky3Ss3HDWymM8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jO9DPgcU/Ldut+maHR/WG9DATahDUSdseMVpit3m2dfcvYCUQIgPHNBNoxBvfK2gGWMI4AmepUambQRq5HhTbbscMbBmXDIJLQz+0zFSIwK4MjP/T3AJjQuo/DRkIo35VMuN3l/N0cp8pS8VrM2RhnhEPzDgVSyin4irTA11Nsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd5gA4pF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39380e79936so70939421fa.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605330; x=1779210130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJXLZ2WHnGQ9RCYFNXqcrh0PjWzX0Q/6bp3kJv3wv/I=;
        b=Fd5gA4pFoWafRzguAOJULDMWOFOXL+ojU0WCWCnwsx7H+R5pcUufdPB5t0PEIxINKP
         8NvUrOlM9zdQJDzFNhdFGMbW3Ie4YuoLgpA9qR3kdkDnhC9qayFgMwPTRObkVEZYfBo3
         ylBV25VMiuy8Li6RErAV4X/aO+3AljZvFsxJF840Oj5aTTH7bPlMMgjBrntcdgZQLL3g
         SJFmiilWfWpXTLWKn9cdiAYg4ACDGI+oOHarYTaiiHaVrvc2XSIcR7unzuOPjg53KRwk
         ekrGr/5/1XXWudOWp79lRrqQPOu3G/1Yj+K9c9IakVJtkvVi2NQrwaB20K7fLfcOkLcd
         B22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605330; x=1779210130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJXLZ2WHnGQ9RCYFNXqcrh0PjWzX0Q/6bp3kJv3wv/I=;
        b=ermFb0eS7MMPoxgn68oCe0HZBTESYDqQAVyXr3jZ8wNG7pPR8jHEIol1vs/wMcU/SP
         xx7rcy9l5bA61TCfuv86o9oiG335X3PFjevecyj1HldsY+FYpAc1dRefjoHeMpie7PA3
         NPCIEOH0kmz8/uL3svoWfTCkr8Dxert3mfzkkqfac5ehOjjv8o6nBzdj2+7v130q0FGl
         dWIYPi7ZL8W4iah4GPYoFiSRb0TMbVtnHjNZ3MFD4xUKZ+KCMphR4orERaXRCtFxGLDl
         onlAhnP4cZ6333G6yLqI+gjY/flB5Bgh2rQ82DTKzCSCunTY81a8XoW+tivgRoVhTIfN
         CWLw==
X-Gm-Message-State: AOJu0YxkoSNEMd87p2X0OBdEvAAykeDsM35SmmmHcX0X+EMndZ7QAeCD
	Q2J0USu14iOjKRENbCkajR04wwJdSKd93GyyBTMoKICBXImrtPOF/EAw7rbpZg==
X-Gm-Gg: Acq92OFiAb74WZBZVgL1dLnFedJE77YSJoRzSjQcNmrrxQmPIbTNEwjw4QFNY6UyhDs
	yMUDeBxGv2kUYiJXxtnspsv/Vie+W9PP/OClvptmw1N1Ac489F/jim9GJIh2gaezcqOu31gmPMZ
	FXZAuqPYOdflMTO+t5Muqb+Y+muSssz30wTPB+GPI8i5Ag+9dX+iJjj5hwEBGo92Rwe1iXAoeze
	Ln8ZjSfW7Gzy+c1B+GVXkBQVcmrDnMbxfAei1Uob2KvXu8uGBCERolesgKPx8kWu10FfT9F9x6/
	fdPZeYB4oMSBbXMTsajA36+lon2N7BwY8QGKf66DhZxrwqg2CniqWe2b46ob2++6P6Z8F8oRE+H
	mdoaUbHcuAmEFKBMI7OTP1O4JPvORPybTWn0uaTYS9m97b6YCY/V4aDyZAg4elo3ja8J1ArybxH
	9K4D9XjnQit9mEZNUKWOSrYKiNQRDdZsp5Rx4=
X-Received: by 2002:a2e:9a09:0:b0:38e:4810:4f36 with SMTP id 38308e7fff4ca-3943cad2caemr12813981fa.9.1778605329181;
        Tue, 12 May 2026 10:02:09 -0700 (PDT)
Received: from foxbook (bfh199.neoplus.adsl.tpnet.pl. [83.28.45.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4fcsm35100621fa.19.2026.05.12.10.02.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 May 2026 10:02:08 -0700 (PDT)
Date: Tue, 12 May 2026 19:02:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Anders Thomson <andtho888@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: renesas 1912:0014 failures
Message-ID: <20260512190203.5695eb7f.michal.pecio@gmail.com>
In-Reply-To: <CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
References: <CAGwGCQ+YFkxxnnbSKbSWC7wsh5ORAT=5riqHJrwsimtqFCuKYw@mail.gmail.com>
	<20260512122719.51338042.michal.pecio@gmail.com>
	<CAGwGCQLjcOkjgDZgxmL0gR6uVwmFjxJ22sMzBYRJLXrDtbZZCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F0365255CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37348-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 12 May 2026 16:40:30 +0200, Anders Thomson wrote:
> Adding that quirk to the boot cmdline, caused this on resume:
> 
> [ 1357.247864] usb usb10: root hub lost power or was reset
> [ 1385.611310] xhci-pci-renesas 0000:03:00.0: PCI post-resume error -110!
> [ 1385.611438] xhci-pci-renesas 0000:03:00.0: HC died; cleaning up
> [ 1385.611491] xhci-pci-renesas 0000:03:00.0: PM: dpm_run_callback():
> pci_pm_resume returns -110
> [ 1385.611506] xhci-pci-renesas 0000:03:00.0: PM: failed to resume
> async: error -110

Looks like the quirk worked, but the chip is still stuck for good.

Sounds like it happens every time?
Does it happen without any connected devices?

Any chance that something goes weird already during suspend?
Maybe try to collect suspend/resume log with extra debug info:

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
dmesg -W |tee log.txt
# suspend and resume
echo 'module xhci_hcd -p' >/proc/dynamic_debug/control # disable
# stop dmesg, send log.txt

It's odd, I have a uPD720202 (the 2 port variant) and it never had
similar problems. But my card doesn't use the standby supply and
hence it fully power cycles the chip during S3 sleep, so it may be
apples to oranges if your card keeps aux power applied.

Regards,
Michal

