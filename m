Return-Path: <linux-usb+bounces-35263-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMw+OvmtvWnIAQMAu9opvQ
	(envelope-from <linux-usb+bounces-35263-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 21:28:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46E2E0D14
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 21:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B280A3008C13
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 20:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698D631DD97;
	Fri, 20 Mar 2026 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDVb4Ctt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDB317161
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038519; cv=none; b=J/us6SmOKs6MuSh6l6h5jyLscrpfMiCdBLAtKDLtalWzDqPjV3E6Tc2qJBsXL4f9Nj8W7xru3Sr1aIhmNQk7VDFGnrHOLP3+6UGsGKHEj6Vf1l5y13Z2/He5VUs2Hto4foP4kzCCj19K3XEIlm4YR4UaUkP4EDqlgIlg2lg3yDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038519; c=relaxed/simple;
	bh=tsmxLd8zQ8LGBZjs3l06V32wBsGNIj35BhRTFAC8rao=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4xRyiQbHMKWImr/Y9GZ+d9X8bS/weB9WJMPZaX2BKMOBq3f8fx5oGM6SZ7v28M0PhphHK6klth9AaI4iqKNEyCQJ4YE4QOSJyUDCHeioUPkda6+Z1sqb7fR+MI77OsQ9X0HJeKQir4GeqRwNt5DCaYeOgQNoZq07Vd8GVsOCn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDVb4Ctt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6686d06c411so3735341a12.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774038516; x=1774643316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2uqpHC8crGoBwvpEVPKVMClmAILgIPIUCSR9CMD600=;
        b=KDVb4Cttuv6z3aR6f5XJC3L456964rUqsUsWgY+h41V016YMpu479B+xGo6JzqEtwp
         FdNxIhCfX5R4jZd5XXygSq5w+zxkeqWERgtwa/yMU3UupDZdf1SA71UmzZMQb+IuBQjo
         BXjFgAG5bHKQt1fx0spMYrPZ66OgMYgwwOvtZKmRWxvkeplL57r0HATfvHd0EuxoTTGf
         4lUo2hUR8zE92ybCPWUBmagrEyzQad3a/CFQ1zUipfUF2uBgy6rW9GQQ4rcXZlF11VyM
         dvsjoir4lZfc5Ts/nMbXxAqe01CRTZKokgvkdr70edUy9p6DLdkAWNcNcu29R+uV5ds8
         e6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774038516; x=1774643316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2uqpHC8crGoBwvpEVPKVMClmAILgIPIUCSR9CMD600=;
        b=eDxVjZxts3kZ6lmLJ0wlxacHIyxHjA1hjxGKsA5Y0UmWxrnJZYmsYr+yHcD41B13bt
         I7IScQ4EnRXG76OuvvamUH4sQVpGQkEvPtFGeGaOIUUEI/al4/YFbw+1r0nTMXqr3ma4
         LXHNgMpAIHnbxriOAss7pWi9k+wH0nuZD4lmXn2ao0VZ4gbVRVO1rOl2zyCHpGz6bx0B
         h0mj/M/+454y2soPf6iTdFABFueFffVrUFsMmPc2fqYwzy2pHRC/uI1N0kXjYCGEpbzX
         Pjrle1VdWSVe7jJnkmcc1DbZw64tndc0YI7rf191EVEOui8Bv44uQ2lqC+jbyUzDFhWy
         bc8A==
X-Forwarded-Encrypted: i=1; AJvYcCWaB4PIW0nF3ua8HZ5wavTft1p0ADVSZK+lQZvR8BAI2oGAKJ1cMvbgZ+VLOsGhsdxTB1TxskBmJl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3gCYodu/EDLR6ViEDlT3EIipHhtvu3EaUyiK++w/nYCVEJnt
	ftuyr6FPg0eBBj5bSFQLNTYscJLdxfeyE5KTm8WOSmMv/RU3hqvF306uBo1SKg==
X-Gm-Gg: ATEYQzxg3e2x2ZE75hJEDaNURNAnxKlmi7pZr6Ib80Q5TYfEhuN6xA5SfaFwkMCyBLB
	GWKg4i0pe+L6vAzM0yeo/Q0WWccRdbhUw22j65ydngcuAcJonOLxwxh/g/Udl4px3OXNmyPLMmS
	AfqKNMEDs615pJRwHQNYGi0a6EPZlicigm4kSkNjH/vRMUqtIjFWbSVaiNz1PVuOs92319rcM0W
	aADbIRM1HLvAIjNsgZSFM3pTUD0cwevZ4oiTLuM2Scy1yh+TYD7qLkU0CHjl40N30B7Ov91z77h
	yPb9mn0YSGczXUIQKajfW7aqqu017NwN119AS0gGLeMglyQH9ZtJ2Mg8azkxiLNyrEughXCJL4k
	nsWlmlnL9xNrCeLadODlBL11SVXqBVlFnPyIFQsFqcq5ZgxF5jfR84U4YNAFW0ZH1/j3WyTqD16
	2fut1eFB6jrkGMOsdF/miwk2PMZAThonmc4I/nvvaGyv3+dQ==
X-Received: by 2002:a17:906:110d:b0:b94:2648:4672 with SMTP id a640c23a62f3a-b982f3b81c7mr256313866b.41.1774038515955;
        Fri, 20 Mar 2026 13:28:35 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm190156266b.14.2026.03.20.13.28.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 13:28:35 -0700 (PDT)
Date: Fri, 20 Mar 2026 21:28:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Niklas Neronin
 <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Simplify clearing the Event Interrupt bit
Message-ID: <20260320212831.0bbabf25.michal.pecio@gmail.com>
In-Reply-To: <20260320211809.705e0cbd.michal.pecio@gmail.com>
References: <20260304114224.62814449.michal.pecio@gmail.com>
	<408ff4ce-1020-472c-9526-312ba8ea2ae1@linux.intel.com>
	<20260320211809.705e0cbd.michal.pecio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35263-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F46E2E0D14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 21:18:09 +0100, Michal Pecio wrote:
> Several other cards (VL805, FL1100, uPD720202, ASM1142, ASM3142) wake
> from s2idle but not S3, including with a keyboard.
> 
> No difference if this patch is reverted, no difference if PCD is
> explicitly cleared in xhci_suspend(). And same problem in Windows.
> Looks like a HW deficiency in those cards.

Actually it's quite obvious: I know for sure that some of them derive
Vbus from the 12V rail, and chances are that the others also do.

Now I'm surprised that NEC and Etron cards bothered to make it work.
Looks like PCIe cards aren't the best option for testing suspend.

