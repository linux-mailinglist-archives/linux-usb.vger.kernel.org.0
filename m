Return-Path: <linux-usb+bounces-36804-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFmdN7rP82nq7AEAu9opvQ
	(envelope-from <linux-usb+bounces-36804-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 23:55:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF404A8683
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 23:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39DB930300D8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 21:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76CF377EC6;
	Thu, 30 Apr 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8awkKP+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3E2ED843
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586101; cv=none; b=P+mL5N+26btnte+Of2qPdUwfzhjRVOqNEY/kykotH1fJ/eIvGrlnE6Q6Rxe2l9LAP7PWa5LHoAlbw65rmP2IwHpONtmQkRUWLVRj2Dx9yVHT3Bew41PlRCWbM84IfJtdmNkeqSJljtIrELWZfs8n4ho/S/2xlWXBxepSi+oK7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586101; c=relaxed/simple;
	bh=OfOzv1CwKJM9L7Z3x9sYHunCD19yBvZ9TOBl02q92j0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8u2/Ck8eXFlLDNbQGJrhvLpwaGPcdR/vtQncqIdU6/XjRFcz7xabi5fukSJnez+AL969tiaQbGvbhjn7MTdcezv6DMxGgTeSQ4rD010ooUFdTXI/g2nagayF/+DHraYOV6Qw79z0n2gjIoFad7vp3CEMXbenr9wqPEXlgk2rMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8awkKP+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so1252527e87.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586098; x=1778190898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htONy2JrV9dOzOKD0squdGdFWilpbZGrAvV2FXjkQoA=;
        b=p8awkKP+xeBPAoUs2/VTBqq0clGHIe1/2oWxk0aGnPcmldlM7HRw4bpK8+dhL/NV1S
         thOa+/3zBgeuirFZIq7Uh1gR0mieOj0pLALwtJG2H15mm0KKdDgyvaCJwsavOHMzhnln
         zNTHtVXGjhAgaFm1kTNDwbKf+Bls7FPvECHNvNq8Exv6aP2lqgrLE5LEMrCgh5KCwX9G
         +8v89JwzdZZt0NMd0jfAt2BwTOWyqjDRhyMP59qq413D2TIajCYlGHNuTBGp07kuRSnM
         Ytnse9jsk9mQf34i+0M9xf7kS5rsDPIm6GsbZuSAwiyOdqfdDCGdDleWiupAy5EBx++W
         4Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586098; x=1778190898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htONy2JrV9dOzOKD0squdGdFWilpbZGrAvV2FXjkQoA=;
        b=FQ/GLQRf+dBZ7g9/z6XdP3Av5GOEjBwjVNreB5h7o00rj6cTgsWWDVT4XFZNTT+RVK
         MrsalwK4hYGlhBZm7N/8mScc9eezgwcBTSpYm1ALRZmRV2Ucg6uUOFmngGyn4Hc6/NWV
         XIHywaMGQXlTIr7KwDXgtoVGdRCJk7/dTytOzO0cfol/RhqYOjmG7dprGO6F2RwrwjQB
         7mF3ID3GGhMnuAkDgzAb8d1dj/f5GraSO5UttX+5fJuyHOgSWg+pjmtUBjFUQhcl1pGQ
         cai1dxOu1uGLigz21EYxnHgOdZtAEYwx2leuv0tCIeLUzR0UQJjexf8AtMGJsESKurqF
         1YFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+J69QoGh5TJC31IOihpxsZgVShVS6bf+s5LXF5Nzy65IepNsXUGS1O8HGXhu/sw2hZCFYJHsoIjNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZJryjYOew/5nzPkhWhDCQiaUInE/2G3GcWXRQxpf6oL8RObc
	A+M6MG1AULpuO6YreqFA4KS7caRq1jvFTB56zYvh6OKHmC07l6ex+YPN
X-Gm-Gg: AeBDies83Lot4T7uB6oZyT5yB4RW9I3ofUIBcaZ4hfLhKEQnw24cMH+8mKVD7g2JqNy
	4qsgHwk8Q/0aLmfYNZCTGQflmRGyaTDYSQfhULCqCBsLTcmCqw3a19c/1suzbGfzwbMeL+oN6kJ
	pAt/WmHpfCweIt5wGmn9GjcwaOMpj01sfJj4tCTwKJUq8EhvJTF5FBfIRxbJ7WSi5Sc8biqlTJD
	D5y4mKutZ7hkRrsuboW0fHzRY+3pP0PkwyDJZsR909moBxRq06R2U4dPQyDBVQaUxO60hE5d6g0
	IoO+oatWhteEqkqiSLv23ZjSMFeV5Ksl4XP68S2H/vSKYKASX+2OkuIrtfJjtfdW99/b/8rPcoW
	XuFmOJwAWtdJWsvdrHLmixO4P4jjMs94z/D3kkH3EGE70qQCFpFV+fo0xgXcA6/OnS+9r2QozjC
	JdflkcdNJvFoCBhcEXE6v+GM1UJsGctst03WWhJY6Mnyk=
X-Received: by 2002:a05:6512:3b22:b0:5a3:f305:a50f with SMTP id 2adb3069b0e04-5a8522d9438mr2292840e87.30.1777586097935;
        Thu, 30 Apr 2026 14:54:57 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85b18c70esm64646e87.70.2026.04.30.14.54.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Apr 2026 14:54:57 -0700 (PDT)
Date: Thu, 30 Apr 2026 23:54:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: bound wait command completion to avoid kdump
 deadlock
Message-ID: <20260430235453.2288c973.michal.pecio@gmail.com>
In-Reply-To: <CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<20260430104850.352bd946.michal.pecio@gmail.com>
	<CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5FF404A8683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36804-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 14:27:59 -0300, Desnes Nunes wrote:
> As for how I saw HSE, while testing the patch before submission, since
> I already had the xhci lock, I just added a read of the usbsts before
> calling xhci_hc_died(xhci):
> 
> ...
> -       wait_for_completion(command->completion);
> -       slot_id = command->slot_id;
> +       if (!wait_for_completion_timeout(command->completion,
> +                                        msecs_to_jiffies(2 *
> command->timeout_ms))) {
> +        spin_lock_irqsave(&xhci->lock, tflags);
> +        usbsts = readl(&xhci->op_regs->status);
> +        xhci_err(xhci,
> +            "TRB_ENABLE_SLOT: no command completion after %lums, USBSTS:%s\n",
> +            2 * command->timeout_ms,
> +            xhci_decode_usbsts(ststr, usbsts));
> +        xhci_hc_died(xhci);
> +        spin_unlock_irqrestore(&xhci->lock, tflags);
> +    }
> ...
> 
> This debug version of the patch printed:
> 
> [   17.481330] xhci_hcd 0000:80:14.0: TRB_ENABLE_SLOT: no command
> completion after 10000ms, USBSTS: 0x00000015 HCHalted HSE PCD

OK, so this chip is busted at that point. But it might still be better
to improve xhci_handle_command_timeout() to deal with this and complete
the command, instead of patching here and in other similar places.

> Actually, from the beginning of all my debugging I already had
> `usbcore.dyndbg=+p xhci_hcd.dyndbg=+p xhci_pci.dyndbg=+p` on the
> kernel cmdline, as well as on the crashkernel's
> KDUMP_COMMANDLINE_APPEND at /etc/sysconfig/kdump.
> 
> On crashkernel's kexec-dmesg of the unpatched kernel I see multiple
> doorbell rings stating the HSE:
> 
> ...
> [Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Command timeout,
> USBSTS: 0x00000015 HCHalted HSE PCD
> [Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Command timeout on
> stopped ring
> [Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Turn aborted command
> 000000005921b827 to no-op
> [Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: // Ding dong!
> ...

Hmm, the "Command timeout on stopped ring" case doesn't obviously lead
to any immediate command completion, and ringing the command doorbell
under HSE won't achieve any progress. Maybe that's the bug.

Could you post full crash kernel dmesg up to that point? Not sure how
it got to this place.

When xhci_handle_command_timeout() logs USBSTS, does it help to add:

if (usbsts & STS_FATAL) {
        xhci_halt(xhci);
        xhci_hc_died(xhci);
        goto time_out_completed;
}

It may not be perfect solution (race conditions?) but it could hint
that we are on the right track, if it works.

Regards,
Michal

