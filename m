Return-Path: <linux-usb+bounces-36662-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AjdKwNc8WlGgQEAu9opvQ
	(envelope-from <linux-usb+bounces-36662-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 03:16:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623C48DEAB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 03:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0CD3071865
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 01:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2C7248896;
	Wed, 29 Apr 2026 01:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Zmk/UYoz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F311482E8
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777425382; cv=none; b=d/3v70kdO76lEqCJiZEsSW8PM8XQFcMuCIxxofhYrqy4KKG0XbyjWOIQ3Eyb8iQKVIegVAP96sF+uMemhVRF6x1a4B3QZ84c0VOnsu7d0wuFf3MbOvnmxVLT3R8mJzl/Tw8BRAlPE13o1p0k38X98377dgKg8mmXe+siysabxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777425382; c=relaxed/simple;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bepAyDqldUgaU7AUkhQjH8pOs+ImVyE9Yg3igtIaqkAEiynlWUFajIZqi9G7AqMhvy3ZL+Nj+bqAMSn1FsHw5AJL5eoW7831aKr05KaolUSi0SeMaQh5ICoPvM8MNAJK53mfA+ly6Yh7V2/9tOnbx/oylPa0V1r73WN/7m1mpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Zmk/UYoz; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777425378;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Zmk/UYozO08t3ZIZGbxo0FBEr9SumSHwa3msNi966lVTPM8u7GX9hA0A0ClgetQsv
	 9qd25c90JCacxxVmC7eeC0s+zVPqdoHwc8unOdZmJ76ozAiq2W+I1LoDLvxuIMLFR+
	 QcTgKC1UCE085ESexo6tPey8sSPufzU4yB9i3BYo=
X-QQ-mid: zesmtpip3t1777425373td3ec577c
X-QQ-Originating-IP: GDJcawdk+BQ6NHO957GYWgpbBB1B8/YjOfUyxDCvAHA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:16:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3897802648851776766
EX-QQ-RecipientCnt: 12
From: Haowen Tu <tuhaowen@uniontech.com>
To: laurent.pinchart@ideasonboard.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: skip resume when writing hibernation image
Date: Wed, 29 Apr 2026 09:16:11 +0800
Message-Id: <20260429011611.1936498-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260428091356.GF3219146@killaraus.ideasonboard.com>
References: <20260428091356.GF3219146@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NlVgJxuVJf8StkM1J2ZmG2chZvjRSewUESoZQ46I8zeGzBlp3WQnU/mj
	uEX4lUUVTXs6dslUHrhQspBnZY1mcnHQBTkC1pjneBLpxu5A5DzJhoKkXh1toujY2fRu574
	7rx6CqvNdDya39WOpHix9QztHCZU+KYwpKgRjdxHWN0fWho2rfzD1NjGbZ7gPXGRYV45EYt
	E2vDJWNlzZUka/KCvvUuqxX5dZJ3afwGFKOjvcIVkaJMsx3LT/tfKBw9/PAwlT9WVB9Ve4Y
	6BVc0pXUWggevr3yTKvo9fW9H9H2LX7d6N2DdGlrPrbCM3OMOQ9twVwX3AXqgBJ8FJjkeA0
	su7ASgVRTgDZUJVcCFDx80ZBRQ0+fUoAZkLNmLhju9tYOhgwhoPAlz2gqg5HL+nhWOE3FT4
	iYFmWjrpu1GcTuM8tHuRLdQo1EsNaocYLMeV4aBDuZ7KH6CTz051BbxDvec3Bie1035k/oW
	lclG0QbF8W0B89EHgky9SLFg4mQM3IOYQQuyWzfjB1wC6u2FcE8T+xdDMa76HUgfK/Ie0kx
	wuLOZc/ahKVb/6Iqo8t89UwC6535Vlud1jm3uwutTgO02J5gjXovzer1TDz7/0obyPNxIA+
	YbJkOOI6pXsZRCI7UZlkC6/FehAToTAF57/AIocTk+SIJDh5yl1VvhYNn3KNGzG1WfocAHZ
	OXq32e0OYnLiALjbxdkGgDPqXVWOpLHNe7F9VdGfHdiyh3V80eFT4BP90Hr+dFzVVzfBDA/
	BwR1K5jfoKV+n0jt6weWIeKZrfco2SKaddLgi89K8feXUEN2jJeK+yyw49Q1VJGpmubzwQa
	oMBt45mu8aZq5yz7Kj2zW8WPX2fO3BYN3FQ/S+T+jeCZGIXaVnidb9JQtSAJi9A1lBFi/vy
	nj7zSOzpIwDSvEF5+VTKOtqRoA7rvV9u+HZn856wJ2yXd0fv0iLsfdFue3NZFHRiHi0q9V0
	ZuTHqKh+Ke+1CLTh0TZrzgEjwK4eo+jXGcsguYcMXEERat+7Jqr8HfTqfMGFdFp1Bqx8ZTU
	2K53RUz82DjVJKy/+LxEsEdC5bnhPceqBUtv1Mu3qxdkBmpYuLV3MTSWAPtbULyzJe1zrrX
	mZcRvbPE/21dAjArcxO0IjCmn7IVhFewU9WmHOzHvu+
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 3623C48DEAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36662-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:dkim,uniontech.com:mid]

Hi Laurent,

On Tue, Apr 28, 2026 at 12:13:56PM +0300, Laurent Pinchart wrote:
> Will all leaf drivers need to implement something similar ? How does
> that scale ?

Thanks, that's a very valid concern.

If this pattern ends up being needed in multiple USB interface drivers,
then handling it in each leaf driver would clearly not scale well.

My initial motivation was that the UVC streaming resume path is reached
from usb_driver.resume(), which doesn't expose the hibernation PM
message. As a result, the driver has no way to distinguish PMSG_THAW
from PMSG_RESTORE locally.

That said, I agree this points to a USB-level design question rather
than just a UVC-specific one. I'll revisit the approach with that in
mind, and will include the USB maintainers and list in the next round.

Thanks,
Haowen

