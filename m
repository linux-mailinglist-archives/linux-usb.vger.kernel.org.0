Return-Path: <linux-usb+bounces-34121-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKDTMkvMqWl+FQEAu9opvQ
	(envelope-from <linux-usb+bounces-34121-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 19:32:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA1216FD9
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 19:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C875B3066892
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 18:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB851F4174;
	Thu,  5 Mar 2026 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUlUMhLq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569C313E3B
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772735532; cv=pass; b=eHcvnA4fIb/Pg/oawZzMakOPfuK5oJPqxyoHD37Xs+ZWW/QGyTIjKLt//bav9Z32tEvWXwmxthFyyOYEHDMj7p/CSBbEa2U6+KKpgI1U9KNqFfGzzq/yJiTwLxBcW2ZyzxK7EBl8x6DD7ZwHNThrM2nfFZA2xMDEMMuhEK6UbEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772735532; c=relaxed/simple;
	bh=Yw3+5+WOXJ9r1tw2rp0WEzaJVgXNnWnNW8qKTm8eql4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipLaZPh/xN1b9Jcl5p4NNO4j4WV/9IE5aw17NzlLJQgHYMabwemKiJZSQ/xPcGZF+/Ca2dggrb8Ir6S+S6G35MgtmT9IT3hgyskCQQF3seNKsK91n0GQH+HvAZXQv/yaB87s3/9B7OjgwZWkWk8TMZ2RMLgu2BMIEMvzw+5ppHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUlUMhLq; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso8007796d50.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 10:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772735530; cv=none;
        d=google.com; s=arc-20240605;
        b=F0kBMnZEO99AQZYlya6huh4j12OMytInSSc3DnAqCmAmjkRPyk7deZghATZ2zV2qsW
         HlSLDdfnPZLJj2MkXvQrnBOi4vkN3mDSBy0aXv3PBE0DSdIGp9XMH1yGpZ3k96FHYS9r
         ygli9A1Ui6pfkxY/CPsBs/4send5vYCUrOcobUMAw0sNvCU/IRD4ir4a3lfAh1VuoY/B
         YnYX9OJtj5sE1Fcrivdw8KLbinS5r5XDMF8tahF2VXGIBy5rGd6zxaqbLHY0CgVVqbmB
         6oRVfwzjlaPJ9eiHJCyWyaJPlBYK1OiI+FYSul9fb0RLkGgFy8blIKclWhzOqWolCG/H
         9iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yw3+5+WOXJ9r1tw2rp0WEzaJVgXNnWnNW8qKTm8eql4=;
        fh=rROJi5ryDwbaTgsR8ARrBiSOAPxrbOZvMm4OAqCcSZE=;
        b=J+YfZOu0jL607qMYrnxmP+kDPM1JOGkPKtBapahp5Yo0ZSkc66ZfhlL/oZDn699nDw
         8qomCeevUA7zYtc6yY/hQpJtggYKqlXk9ICiz1Or5HktPNIMVoUp41FqI4CbMAgOGUhl
         +jQiKkFdyu7vJdgfmTEVMTg6uqosd+T/rTk6oOGf6pnBNV/u4dV+MkJTPwZ/YePdvukO
         DvAUrkSkNiRTwCc8fLvmYfYTeW8+UgihEgl31iPKzd3pBi7pfpKhWgS7aWurfT+8f6CH
         j6LFX71D+3lBVzTP5aM098vOXnugFKO5w8U1U0I7W96+kPC7n+AcNmy6Kj/EA3vvoDwK
         NVqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772735530; x=1773340330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw3+5+WOXJ9r1tw2rp0WEzaJVgXNnWnNW8qKTm8eql4=;
        b=iUlUMhLqpvruitLsQeAsuwV6tX2+6+suBjpvCVGdLXiLpemJmUPm8qAQiOHEqS4I1y
         LamfkHvuOyK3OVfOS9rnVfwpqn1FeAwmD2P5z8sRwmOanzI0LkRa7/YxECEi/ewGXAkJ
         A9hHYiEsCZFWeDwoXAbFhG2/T3W/2IKzqFSTEyxSsUtxnyMV48iUQEFyYMtmfmAIXUrd
         jetG1w818wmgb+tUfhsP4HaA9EIGkZu7/S13LgwWdyN+Tih0WaI+JhEE/YdtFUFrOZQv
         SfKFt8Mewt+snOyB3NEqf/RQQSrKuN5o8tlZXqLvjMKnp3MJFSoramHU2/MMVfNd/MMh
         eQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735530; x=1773340330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yw3+5+WOXJ9r1tw2rp0WEzaJVgXNnWnNW8qKTm8eql4=;
        b=bXCVy4FXHNiLIpD3E6S5WE/q2SLb5g4y1pBne75OGA3xqrIn7gqkm+nZ7y5h4hltgx
         sPLkIUNobOVEsBEm//S0Eo1fNRWfWSphWBs1PmsayaMMNuRQQOUMX+0RH/lRVJ7GFUY2
         EvDwWEgSgjj0Eto3Qm2KSxDd29yyWJB+KUsSD/k/r4BqnSWBPBe0kiZq98g8wjcEwL26
         xplm018KRV10Ry1JPckTgvYnDM3mdc5a25ZZMp2wBB7gagl5G3QIJPQmo+r4/yoME88D
         qnuYf6OFxbtfmZXObrlt8Je4y8+WnO5JJy/8W13ZSBsXIIWiwiTKJ0QfckFW2Srr4ABM
         8VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaqBmsWwp5ZTtbvA6MIyUoCYQtHY55hyv6UyckDRamdniCtdfQIN7ma12lvgT1fqkqRwD02v0mDYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgOSt8zttveHxa5C7vVjYgeWswrHiiSAmR5oTYU5ZLi0+4U3W
	XE7ACj/dMP7hkhsKo6+s0HgYpNegVA1K5OrOszgJs4J7LIQ1OnPy/kxJEXy/uFwPY9miPa7JAWo
	X8y3SdwZkQJvGpHfZMDHt/M8/WMWfhBNyOYK0
X-Gm-Gg: ATEYQzxB2/ktp3S4Yy5bzGcYcUfMnlqxMdIQSSg/0LJ+TmnN+50LBubxsBdWqCDsUMd
	XV5jOEFxlQ7HHAnBLpQtPnrj3LCJ8nePbWNlu1X3n8178s5DQovVF8K/q1G0EWCf9+s4q06jskW
	6nqwUQ0VVMEIGM4g2nhadVRFtViaNdMBGqCMwJ2eCXgjIJYaMYzbS1T+LkU2Mz2NybbHLTqX5JH
	RPdayjEnC+ygD64RIN0QPU2t2LmN2a0DPfp58hBoGdUrvBJJGt/z5y+rhBvrSGS1cWpSaL9Y1fB
	WFqfbw==
X-Received: by 2002:a05:690e:bc6:b0:64a:d45b:a4c4 with SMTP id
 956f58d0204a3-64d10bb2f13mr753489d50.3.1772735530015; Thu, 05 Mar 2026
 10:32:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305171837.3114157-1-dave.hansen@linux.intel.com> <61f7f7a3-4e7e-48b7-bc12-5f92f9cf18bf@intel.com>
In-Reply-To: <61f7f7a3-4e7e-48b7-bc12-5f92f9cf18bf@intel.com>
From: Joe Talbott <joetalbott@gmail.com>
Date: Thu, 5 Mar 2026 13:31:58 -0500
X-Gm-Features: AaiRm50yIIJ5JkyG9WeF71cRDvkLyhtNV8K7-B2rDClPfct9xgvn6zAPiHEoeyA
Message-ID: <CAL7gdfdg-eh8OoABELP_Gf6Fu+VgftOqHsWwgBpFPiwCeJcb=Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing maintaner, mark thunderbold
 DMA test as orphan
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 30AA1216FD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-34121-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joetalbott@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 12:42=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 3/5/26 09:18, Dave Hansen wrote:
> > This maintainer's email is now bouncing. Remove them and mark
> > the code as an orphan for now.
>
> ... and I'm a doofus. I'm not sending things via my normal workflow and
> I missed:
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
>
>

In the subject s/bold/bolt/

