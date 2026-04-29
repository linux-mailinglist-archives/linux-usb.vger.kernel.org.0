Return-Path: <linux-usb+bounces-36661-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICNdCuJb8WlGgQEAu9opvQ
	(envelope-from <linux-usb+bounces-36661-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 03:16:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731448DE8B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 03:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C67823051CBF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 01:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE90223DC6;
	Wed, 29 Apr 2026 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GRq/aaug"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6181482E8
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777425356; cv=none; b=Lj6+5G7GWYzT2qYqPRjIw+oFvn+rhZXro29xb8FD1Q7NoW/hYDT5gh+lTm3F+6qCdy1cEs6UuhBq37oYYI3D8KF9dwjuPp1CCDpGKNrvoJ4XwAWGVnN/HSLSEJFzDveWwrV/rnpCztOc09GfPsywujezgf9YioWik6JCUhno9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777425356; c=relaxed/simple;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YvoSnTQeyzVHyKLMfNQjIkMJcyFDgctnVKyfFKNXmYB6PAaIKKgaQHvXbJFwx58x5iFKmVWoLiiNT6cOL6j0ND81BG8g7U+ZeveaRTKz4N8BRowvVP8C0dH/TCa2+b6MKgGUf3hb8bKXkQTqzazwBhfPoc8dERo03uISIdT0D2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GRq/aaug; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777425350;
	bh=S+FNbfKs3zWzpba+7WwK68JDLp3UZ3kapy9H/lK6Gi4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=GRq/aaug5EgpnX7KC3HZtYa4R0c5hic/2TbSLwND73Hpq4E+76yNmPePvyzq0LuOW
	 ZZmtB5ZqzTBMU3VjDLz9uoNhVUkzMuIZQe/OxBBwjdRiqjwR5HuMGKOceYHQVfmzcd
	 hiu2rsLFe7ByWi/VW8eZ9tz0o1LX7Bml82SZctEA=
X-QQ-mid: zesmtpip3t1777425346taac8aee5
X-QQ-Originating-IP: jNQDoEUcLVArnC5uGOzW+T+6J0rgvHPUr5JzTWgQ2yg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:15:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18189464401092096931
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
Date: Wed, 29 Apr 2026 09:15:42 +0800
Message-Id: <20260429011542.1936211-1-tuhaowen@uniontech.com>
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
X-QQ-XMAILINFO: Npb+f4q7yCDR66IiiM+frrEC8JnTY9/JAUTclIOnOyGlW7tZzTNMApNf
	R9HcwgRQoTqvdeN1n7O5hdZXVvgUS/ZDdCdHbYE6cLAVMiMtvHs3LKecHoYo7jrNpGltvzN
	rD7QMhCz2sHcCdDIBT82pUjAFtigF3T7IGczj1G1gmwOM3XKlbp72X5Pefbnw7qMo7WR5Mx
	kX5b1KXoE5ItkeOl8Zgxo7gYNBsRjaOOkt0TqgSpNt3bTc8oKX4HUuGbiESdn1ebEhX0Szq
	OMCEaav4lvEGIX2glCp8P20LmV0i8e4MbT1wmusHS2kQqP4g6ql5Mp0r7ZKXOnWgQqCYBG4
	/VD7TEdvWmvGqErDdaZGejlnQiphuHA2iZ698huZc0etLNYh9R1UBLjxspA+EoabYDlI0Mn
	nW/qnJ9trgv3rf4uLYsv5nkTZCFXTNfH09AUQY4peB4Myt4lo3VmCshPILqgveJct11Yv+q
	6HJqTQLYJ0X71hggQuEyL91ADcRpSbWtjLx4PTya/iLfQ5qftds4d5QHYftY1AZEQEQmkmC
	rk0jQR+lOrQm38SRPGchKOoNAHeZB0lbTkrtBORDAy88aPyT51uuw9sZ0fkIRvbv5g5LyZN
	7U9Ybl959SfomwptxTTHBf2c4xm5XB0Dj0PdtDqhIrFnLRJYwBzSFO1SdMF9DXG37qiLL02
	X2hlPz/6v1FS2jHpFhgXwcicLD9Fq3pQWJxA00pbh/7DNePt/pBUILtEAq6sXSvDvf0Nqoe
	IuB0WZHOsbQDAWYseX95yOdpx0saNP1L/OdBvyl2E5k6YGU9JLdw9arSiZRJxr6bByK19YZ
	658epNPyaY2NvIjzsfLD63+cZXhVvgwPOnOPqKk7BbltlUdhLc3wNMcKbWrOtzUVPvLVmjC
	Jz2lGxyHiC8K6SDpJU85xy8hdDPnjcn9VVCQh6vwbIlZOf4xShfWMqeT7e5OlcNqY5U7h5W
	8ClSkenRGpmpWbo0XgOvSr61UJgoV0lMSWD6CsEsmKJkxeI+jbZ+xuIN/QhuMWYxXgfhB+m
	8NfiaREzrjzQIpp/9kvbCTvAibJ8fyVTZOZcLFaqkoRnRKYQgrPyw/xo4pdJ0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 0731448DE8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36661-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

