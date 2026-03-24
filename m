Return-Path: <linux-usb+bounces-35409-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHuBBortwmkdnQQAu9opvQ
	(envelope-from <linux-usb+bounces-35409-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:01:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C245131C036
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12A8B3023E15
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 19:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FDB30DEDD;
	Tue, 24 Mar 2026 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkBf6S52"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630628751B
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382174; cv=pass; b=lmQ66rYV7uDiuq0RitDvxEN/e9hZixUli+hEhWeALrrX8A81vmbXqk0LrdmcH36zMZNHxJBhN3KjeHNORrvkGLycm2D/lmtS9WrqAQvAUwWvFxXZ4h5bWNLD+pg/UMzh9IoFf//6ep3zJ93HPwcJoxpGeza/ZIwIJrQJ0UN58xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382174; c=relaxed/simple;
	bh=oR8xUTPOj3/MQ4wkgPJM/M5JNRfvF7PQNZmCBV8vP5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu9I1g5GIsxjysw5a6dZDXYLbOKEAQ6Ae/cfZa8OBuYFcGX1K4iprLsTFiCid9af+uB+GIEB5TUETiJt2UMxa7bNa8ZLuuZDWbtA3OK7pOUzX2W2SBK/Y7hYIp8KDB2+dtOalJ9eVB4zAI8KjFd4lKfhWbRQ0aRdbHgOOyZ9EVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkBf6S52; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50b29c4e554so53378101cf.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 12:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774382172; cv=none;
        d=google.com; s=arc-20240605;
        b=KzhSOcyObmEXvw43aJpEnDV0x/7TqDAGLn/wE/+oLxBn6AIuzZegeYuykV62X42OZA
         XOfTkBUdl2bSWrepxpH4Ind2RbMng3pjjcI4h5WpJfX0ih5wK/lb3yoXvNfOSI1yHYAt
         lYNBnOfJNZJnIp3JMBvuL9UmI1jz1513CybmT8O3HJAJWNbkw6ZsnzO3LaL7AMMrP0IC
         k+3SHoPr6Ksfm59+18ULR8sdPHJKibYd021LGOiYWpCe0Q3bImG6+vtSfuQIRcATgGD5
         nCo+EPdMTjZTnHCUxLttQMpD48dBvo9H/Y/jBX4WUFyrTFnWYd5xsEH5qlHjJ39V6diI
         ThhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aPRDpn/My64eHIRqLgmhXyxMCxs/fXj5TEoqaC2Rfng=;
        fh=RJk+pZqpqHiQVCVuJD0Zn0GPfBYL6VTxd4FySlr35Q8=;
        b=GRX+ohmd8aJvY2I39A/0xj/NUdSbeHj9JB7DrRx/cGUbxuYSI8T54oWrgB/YUKPi5e
         vvIEYOh9Hi7izm0/M1XseQzMWdkhmKT6PCDeHmoDNwrayGb6MFqcZk+sGDPPHmxKNWZ7
         ShMAzn4e9Bwhwm8NoaN4ynjhUktawq9Xsd5+v+/LTcdOeNq41CSChQk0l+fYkmjA97eb
         F//Cc91qQMUW2uYv/s3GMOSwvycBp1awNpbRiBLB8OnchKOXDSf4CXFAUDBDXwUUNj7D
         A3+HNJFckFt461VhV/g5jfVH7BStj8agew7YLPka7jqg+BgPHzOBfLI72GVXLwUf7Nnl
         VUrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774382172; x=1774986972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aPRDpn/My64eHIRqLgmhXyxMCxs/fXj5TEoqaC2Rfng=;
        b=BkBf6S52PLjXzr6TESQ5jT3WdIpA8JqFogqGfYhL5EXt7CALk39t0OW7Z0sdeBmCLD
         3p61NSZp8ws5bJhdl9O9gmIanGhdlKjCTB4HeCnc6O5R7JHLoCTVvWMROMH+OJCUFrpm
         58G/J4UyKwm6W9NVuTeD6T4acgLlqKytKWtDCSJBTeF7z+m1q7OrB9GCtkQyrNkcyt2m
         ZisflvO2kFOdbG91M/EgKovebGtXHxh7KmCLesPBlEEinWLQO8tQipUhridv2IhoSwE2
         NUM7iSqAxv86g5eE6/mTTUVMms+FmvVinZKDVfEU2eWJYk67EiWH743Mhtk+3j5VvlnL
         fZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382172; x=1774986972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPRDpn/My64eHIRqLgmhXyxMCxs/fXj5TEoqaC2Rfng=;
        b=AObLxCXugVBMRmR3JUmZS8tpnwdF3ZMyT5+rrSkqnLuLbLDBZdwm7ip7XtMNPsghOE
         eZFBFpbik4ZxCPiHGhbul9Wt14OnPm31y/0s+oiC7fvLi0GMvV7tXl2BRZyBaJCyMz2E
         vnCTDSFtaM6/TrkQ/p/OdoyK105228scFABoc9AUGg/MW+IWFGheKfiJkEJnDDK9SnQk
         b2ZUNdkEI5GvsTUqprKRRJO2tnNk/vJCkT+ulfnD8AwAXCWQ3o2szJkf7pquN1UP+Rsm
         y1+9q7FNXxAyJpywwMRIOZwcRzClc5iccT9lFnJRougHfyRZhB8s8CC+dcbcwOrAfQIC
         slVw==
X-Gm-Message-State: AOJu0Yy+FFOLB20xM6K7sVunOsrvfaD0kR/URYAIXy7ALXbta0ypHL2Y
	mS1aXaHlix/J78y24Av5W1S31IuVWDH58UwDZbPvyOw+Bmgv3PYeSHG6y6alOxMrUUJwdo6ADiN
	ivxNQgFCU31eUBArc7Vn4/0pznmCCItd4/I28NHA=
X-Gm-Gg: ATEYQzwcIrVqriynEmyIV/W/FCmCFQr1gBwd03lVmT/cEGyEeYks+Jqtcyi15z8tfDs
	S9sTy4tiYM0jrr0W7m0NUDPX7IsblxuYta89nAjzqQ23vgaCEmtAPaO+tsfTsEr4cvtY26RCfcT
	cqNqoj9SlC6KMgjLXv4sxZ9LkqKeq9axf6+vhuhd9E2tDohKElFouFbbJMZemz2d+NwlNxLPdu8
	tsu5DpmN7/lknf5Ym4gVk9vxLhkmH9qjtSM16HN0DUWlG2at2PEDfHQeSO93tNsLBU8AkbuXbO8
	MuyUrGPfeldibCWt9zHYzwtoDoq/FPuQpYTkOCuC8UjfQdHd6h7idO7QvGSnTVZTy6A8XgFgQai
	BhppfSQuI1GARKYLSHWBg7yN2
X-Received: by 2002:a05:622a:999:b0:50b:496c:baba with SMTP id
 d75a77b69052e-50b80e67611mr14651491cf.57.1774382172102; Tue, 24 Mar 2026
 12:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
 <2026032337-resend-recolor-efc5@gregkh> <CAN9vWD+N6K4VExNgnhp=amfBDJTFN9Sz156qsy550dP-d1S9Qw@mail.gmail.com>
 <2026032431-chance-dodge-6b6e@gregkh>
In-Reply-To: <2026032431-chance-dodge-6b6e@gregkh>
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Tue, 24 Mar 2026 20:56:00 +0100
X-Gm-Features: AaiRm53wHoShpUyzEpK9IIkES0eJonyh5hEp7Z4GrUh656OHTon151kaSNg-mBM
Message-ID: <CAN9vWDKZn0Ts5JyV2_xcAmbnBEi0znMLg_USMFrShRryXrgWGQ@mail.gmail.com>
Subject: Re: Oops when rebinding f_hid while /dev/hidg* is still opened
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35409-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C245131C036
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Ok, something is not being initialized again properly.
>
> Take a look at the patch series at commit 41f71deda1c1 ("Merge patch
> series "usb: gadget: Refactor function drivers to use __free()
> cleanup"")
>
> Perhaps something like commit 42988380ac67 ("usb: gadget: f_ecm:
> Refactor bind path to use __free()") should be done for the f_hid
> driver?  Can you work on that as you have a way to test this well, or do
> you want a patch to test?

First off, I had an aha moment about `89ff3dfac604 usb: gadget: f_hid:
fix f_hidg lifetime vs cdev`, which I mentioned in my original mail:
That one seems to have fixed removing an hid function while the cdev
is opened. The issue I'm seeing is about binding/unbinding the udc
while the cdev is opened.

I don't see anything wrong with the goto error handling in f_hid's
unbind, but I've done some tests regarding my suspicion about
cdev_init, and it looks like that is actually the problem. Calling it
on an already initialized structure is simply unsafe (unless there are
no references left). The lifetime of the cdev is bound to the device
in hidg, but the bind/unbind procedure can happen independent of that.

I see two solutions to that:
- Move cdev_init to hidg_alloc and cdev_device_del to hidg_release.
I've tested this and it removes the issue, but it changes the
behavior. With that, the /dev/hidg* will be created as soon as you
allocate the function and bind/unbind of a udc device has no effect on
its existence. Only deleting a function will remove it.
- Use cdev_alloc in hidg_alloc. This would allow replacing the cdev
without invalidating the old one. This would probably require
introducing a global variable with a list of hidg functions though to
provide an alternative to "container_of(inode->i_cdev, struct f_hidg,
cdev);"

Any thoughts about the best way to proceed with this?

Thanks
Michael

