Return-Path: <linux-usb+bounces-34518-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB39CU4asWluqwIAu9opvQ
	(envelope-from <linux-usb+bounces-34518-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 08:31:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCE25DFE2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 08:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3CB73083DF4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 07:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEE43B27DF;
	Wed, 11 Mar 2026 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btFi3Vpk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD23B0ACA
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213783; cv=none; b=Qsppx7QIsYBwX8wRzMYxjvMBAHVGODS5E1HmpUE/tuFxXpChOuzCIloqiWJf7JXpOHeRvl53EXcEkcy5G6OioeoWmsnJ8DlIoarDoUaQs/qbkbkIumscT+Vl9wbkUzPJfTa5TzHZO9QXgCwLRJZtnkRBsqYLwC7AuqgZ3roKVjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213783; c=relaxed/simple;
	bh=4h7q0aW632IYrtgogyF1+Py8qp0ql8NGsU4ff1gYQPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQ1IvDBl4R6xJ4mu62jWYjta8lSe4npCfnL5Ae3NblA9pxfR4j/ADpePi9qIqz2f5Slj5xq3N8AjosAJc65dfDL2I0tqt65ROKH/xyA7pBTjvmub56xtgXk4FSnRxwR9JOMXbwGfrHolNfRXeMs2Flh9SmUKuaLGWjrF0yl/VOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btFi3Vpk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so474394f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773213772; x=1773818572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsP9rDmMXfVGzEA1J0kgDggGIcSaIxHDyX+DUVCfTBk=;
        b=btFi3Vpk2Cg+ry5PoMZVp2H3ghehUZpNvMuIYyrmAhmoOpQEmauBSTllaiTtWvxNZq
         lliL2h++UPGdIGjjbIIrCSnisUhPTp1PkU/FLATtLUOPg+M/HpXacQJvUszLHEZ8tuX+
         /6z1QdRft7KXYuNAu9c8sI0CLZNAqDlBkpr5Sga/Cq3ngRK3yjQ0gETNEnqlNlEwQfnf
         +YZ0omtonJs2/5TVXus4b3E87iBrkcr77hbEhSMKJg5CAKkNwSYkgRYJzZPB6GvG8e91
         /MJdNOV7AOzoqSPbLlMaSxPAfuGho/9IbO0M32kgVzNxRh1mWEx+fdNIbUgIPOSRglV1
         Wjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773213772; x=1773818572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsP9rDmMXfVGzEA1J0kgDggGIcSaIxHDyX+DUVCfTBk=;
        b=dbTLYGaKPyozEfCqxJqpWBFKol4GTVjIPPUiP1GRjEvsiAT1knRWglojsAx8g3LQsP
         SpMYIKdY2yuwovWO7Km+6/uVwadkQBQ/ZNUmGasqfiU8P9xxCJ4fqCMRBRIQ09nZNtY4
         +onLHllaAu5UXGrRQytggbSxMUhu7HkbjoynuWMae7htJlXkuvTPgN15ecTUlRq8slmz
         /UuCeemudn4VtR2JZntUnByOqFc/sP9pSUYIPROtOTCbzJXIPckT5gTGEJnFKxb2V/59
         tKkcCjtkkibuNh4C/bHeyTlYSuWpRPfIEUTLr+zLWIRdJnQ7PGckl/2gsfTLhHf5UJZm
         KLfg==
X-Forwarded-Encrypted: i=1; AJvYcCU4r+Tza0Jw5EMAtiVpCnLogTUd5r3ckckd5TXXLqENeyc6PvhISeKtB4TKb3dzhFYGg1o+3w7a0tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/q/tsrEZEZzSdrnnuCoCkgEFCCGoGsFLpqSquT9p5jQ6wS4qt
	ao0JKxVbiPF5XvZhu+GFHJe2Qf7me7b6fo07uCT4G2Q4A6+qGEIuvMWVYgphHvkS+3M=
X-Gm-Gg: ATEYQzzt/j5kkMHSNkgTQvYPP8Sj/9oc7L1wwVuDpJNJoZnXwpsBQciI/mXirL+HG4S
	wu8JlLL7Pl0mrGReXR2kqR6AFf8hTFZp6z/5f/boUbJ1eV/DQGxG9ZvoNcx28L4bfvrSLUdybY/
	r18uakoEIG4JxujjCYHU3zakbIgynZphfCYCofxDoEiufTgy1cLJRCIaGhH7Hduys4QsQM7D0F8
	udd6rLVnQDOC9mXN1br00XqOvTq91V/QeNE3g/a4gQfJ1CLz5kNiJ3yX3SVCsQgfz8FRfuQ7OX6
	S3SJi4DsdAI/+n9xDa2MNYf/Lu73l54MlmcPUfvrYXuwMYeHifn9BQ4GVZPwoDNni2d8PpG+k0Z
	Pye3wUrXpw1P9yM4JxXJ0j0MNvFuPq+A1SjxzampGWcoceHqeIm9PuIypVCsAuZ+XH58mdH73dM
	JTQmt3ur5HxS1bQc5BiQ5iT6/wN52s
X-Received: by 2002:a05:600c:19d4:b0:485:3294:fff0 with SMTP id 5b1f17b1804b1-4854b29e736mr22629695e9.17.1773213772335;
        Wed, 11 Mar 2026 00:22:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821d895sm4240139f8f.33.2026.03.11.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:22:51 -0700 (PDT)
Date: Wed, 11 Mar 2026 10:22:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Ai Chao <aichao@kylinos.cn>, gregkh@linuxfoundation.org, b-liu@ti.com,
	johan@kernel.org, badhri@google.com,
	heikki.krogerus@linux.intel.com, valentina.manea.m@gmail.com,
	shuah@kernel.org, i@zenithal.me, tiwai@suse.de, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, prashanth.k@oss.qualcomm.com,
	khtsai@google.com, tglx@kernel.org, mingo@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
Message-ID: <abEYSBb8LJo9iVPL@stanley.mountain>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
 <20260310094434.3639602-7-aichao@kylinos.cn>
 <b49bc467-8c51-41fc-a7ee-5770a9720deb@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b49bc467-8c51-41fc-a7ee-5770a9720deb@linuxfoundation.org>
X-Rspamd-Queue-Id: BCDCE25DFE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34518-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,stanley.mountain:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:10:20PM -0600, Shuah Khan wrote:
> On 3/10/26 03:44, Ai Chao wrote:
> > Use a safer function strscpy() instead of strcpy() for copying to
> > arrays.
> > 
> > Only idiomatic code replacement, and no functional changes.
> 
> It is a functional change since it calls a new routine. Get rid
> of this line from change log.
> 
> How did you test this patch? I am curious because of you are
> describing the change as "idiomatic code replacement"
> 

I liked the commit message...  To me it says that patch affect
runtime.  It doesn' fix any bugs or introduce any bugs.  Too often
these changes are sold as a "potential" bugfix, which means people
haven't bothered to check whether it fixes a bug or not.

It's the right thing to add a note under the --- cut off that the
patch hasn't been tested.  Testing isn't required for this sort
of patch but a note is good so reviewers will know to be careful.

regards,
dan carpenter


