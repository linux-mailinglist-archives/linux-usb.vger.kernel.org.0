Return-Path: <linux-usb+bounces-35288-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJzpCqHUv2nD8wMAu9opvQ
	(envelope-from <linux-usb+bounces-35288-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 12:38:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E42E8F09
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 12:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4CE3011BEE
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 11:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB34730FF33;
	Sun, 22 Mar 2026 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt9EChy2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D3175A80
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774179424; cv=none; b=AAfkbQz7Qd3njYVaEkAmqFYLmNIDS9CJfcpdxN0E9tTIj2wNC2BhXHHWjLCRp7yvtoPSykURZQoIdoJWJoebALNs6zwCvBcTbDASDECRs2Pgxe4Ba/y2G+EOd5/UMleXOpDzAnFQxcJZ6/n4ffhVMEVm4ltJM0nJ7PGAz3F+c8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774179424; c=relaxed/simple;
	bh=BPFDReq+IxxprKLy4MITwa0yFMWHj8mYVnwiPcozE4o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=te4aoYNViiInkCJ2CJ57CSfS2wW1k/1AKG1NHPsn5UvN4WE+7AIA58ToKboNpLP/zoAPqZNOpoDHrJYOY/0ZIDGxH/8KIJsvu2C8wLdE6cWJlTlsEtPwTc1BbPHMVUZqGcEGu9wqRdeS01xbm8jYjJ+vjWhzraUlWITT+f1e32Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt9EChy2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9831ed36d4so287664466b.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774179421; x=1774784221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeT356Zmfot7HIxwjf89MaikFd8atwjnZh7p0cZChxw=;
        b=Vt9EChy2/uW3GwxT5abSL6cnioGjWbZby6hug5kxXMemfpdjBZ7+A/XfjqeSiOGoU+
         EmJxcRcsXZ08LTR0plk7jqvSvHRjmLLS6V2FNhSPau4OdIZhWgbbIgyGTXwO111HaikG
         /c2JxbSLlZ9Q+J6tvkkIyecRtB/TmXP1Bw/fmwvoevHxqVKQdk3gdDieEHRsg9GdQ100
         jRTT5u+vM8etnn7ACYBNHqPS0vhdZ83Rw/W1yBIU4N/bHMljzJUf+PTJFo5DXY7SHGgT
         EZiLl0HtalFWn3D4IwT1F3G3/AHYbifXBEN3Lb5pwCFHDGATNYSj3zGn83Mkc6KffIBa
         mUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774179421; x=1774784221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeT356Zmfot7HIxwjf89MaikFd8atwjnZh7p0cZChxw=;
        b=m57Wf+Ybp3AVB34qLH0j00munVEmhpMWaTLz68jpf+JjXpBl0Vsw2qQtHWajfuXDta
         hWk/bOFuch/F2T7uIhqETvNZsWzElerpBCemmgOH0hQPb/quyWrTfjaX5WGDqdnUU0SB
         Cy79zHc4SQfXNf90ahb/sOCR56UEcDPmsOOgHi3S4XWcFGEOL6W61733sKdmKVBbPmD8
         f87HDD4GBUN61MMUrIdz5ItRQ8gxB3ModRoNeveoX2k5jNHQGmMvdmKCTJRj1ZZzkweV
         zPS0x604U4HuAZXwYAflWIHTPMIS5BLsroMMNsfwxla3KtkBe+QHCNPt9WzJNBl4eiOO
         1UaA==
X-Forwarded-Encrypted: i=1; AJvYcCWmzGwlQWl8/OOBdZFqNiLDFiN/+FNEoW7qwoWTefSSK6359emORIV3qkODgTYhn+0u7vMvH/i3R8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qCxwE/WduqfknuPzvHM7aGDyEklnjqBq2f9yxCvyPFPQ1f4L
	WghAWoRRFJs1u0RXlNtVHQHjAUtTAHNxy4Wx74OZzjjy/8RBJKT2AHpqYCzaAw==
X-Gm-Gg: ATEYQzz5WiY3sgo2XOnnxeUYIq78YiSaLOQLwITV2t6XhrzxUJgo+7054aDRcrmok1v
	cQKuNP4n+4FRnoPTZRPbMWyV5ZT8mPFGeICU2Oh2HDmYSYqfcTQGX4F7XT6ULKEAfeaZdviCiXY
	oMtug5xA7NQGZZoKcyuVIQKK/6lQlI2ELt6GnMeDBM/zpuLgjfAl5axHCpi+VCB3LhuM/I0TQ+J
	scqqtnfs3qRZpYHoatb3HcurEYfaOgewsgE+uxYh/p5k6vnjKhdOXHrIa+ebxEnsINvRjhYbXUE
	tEhWPgWA+0i8sgu9VT6gOGGk4Xzz8SvoLHsGRpBiqi9Fl4kjAPEB9Exo5i4sap/FH8dNHSjMue5
	p5w2G9pKQ+JQLsxilOX6/QxkMbUnBcJxiYF5N7OkfLsB9PCyxsgDBczIWKSnd82u76UJM9GnYxl
	0AXEkqsD2fw3FZm/c11ePMPC0o4aASIYF3N2s=
X-Received: by 2002:a17:907:c20d:b0:b98:b08:7459 with SMTP id a640c23a62f3a-b982f0c00f3mr607306666b.8.1774179421054;
        Sun, 22 Mar 2026 04:37:01 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a159sm349118966b.44.2026.03.22.04.37.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Mar 2026 04:37:00 -0700 (PDT)
Date: Sun, 22 Mar 2026 12:36:55 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: xhci: use writeq() for CA write on 64-bit
 architectures
Message-ID: <20260322123655.537881d7.michal.pecio@gmail.com>
In-Reply-To: <20260316142720.1471906-3-niklas.neronin@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
	<20260316142720.1471906-3-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35288-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 837E42E8F09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 15:27:20 +0100, Niklas Neronin wrote:
> Setting the Command Abort (CA) bit in the Command Ring Control
> Register (CRCR) stops command execution by clearing the Command Ring
> Running (CRR). Some controllers latch CRCR only when the upper 32
> bits are written, requiring a retry sequence when the initial lower
> 32-bit write does not update CRR. While CRR=1, the controller ignores
> all CRP updates, so no field other than CA may be modified.
> 
> On 64-bit architectures (CONFIG_64BIT=y), writeq() performs a single,
> atomic 64-bit MMIO write. Using writeq() for the CA write ensures
> that all 64 bits reach the controller in one bus transaction, without
> giving controller the opportunity to process the abort between 32-bit
> writes.
> 
> All xHCI 64-bit registers are accessed via lo_hi_writeq().
> Earlier attempts to replace these with writeq()/readq() caused
> regressions and were reverted [1]. The underlying cause was never
> identified [2]. It may have been a quirk in writeq() implementation
> or controller-specific hardware behavior, both of which are likely no
> longer relevant after more than a decade of kernel and hardware
> evolution.

The cause was HW misbehavior and nothing has changed. I have this
ASM1042 piece of crap here and it still behaves the same. Using
writeq() to implement xhci_write_64() breaks it - no events and no
IRQs are generated for Enable Slot commands or port connections.

This HC doesn't have AC64 capability and it's unclear if such HW can
be expected to handle writeq() or readq(). Per 5.3.6 and 5.1, upper
bits are "not implemented" or "unused" and software "should" use DWORD
writes to access registers.

> To reduce risk, this change introduces writeq() only for the CA write
> path while retaining the fallback upper 32-bit write. This keeps the
> change contained and allows gradual validation across different
> hardware.

That being said, setting the CA bit with writeq() does actually work
on ASM1042. But I haven't tested all other 32 bit HCs yet ;)

And this chip doesn't really abort commands. The operation can only
succeed if the command accidentally completes by itself. For example,
Address Device completes with Transaction Error if I unplug the device.

Later ASM chips are similar, but they added internal Address Device
timeout so the command always completes with TrErr after a few seconds.
If you try to abort it earlier (e.g. while attempting to abort the
previous command too late) then abort waits for the internal timeout. 

So command abort on ASM can take any arbitrary time and still succeed.

Regards,
Michal

