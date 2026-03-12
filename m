Return-Path: <linux-usb+bounces-34676-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAE/EhegsmkOOQAAu9opvQ
	(envelope-from <linux-usb+bounces-34676-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:14:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6D270B52
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 12:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CE62300B9F5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 11:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B158139C01E;
	Thu, 12 Mar 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=corfauth94@gmx.com header.b="IDVs/A7c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6138F62A
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314058; cv=none; b=hShmBDAmMyYU145UX8aN3cgU+CVPNzZC5aI7TjOmfMlcXlPcSUpeRZ0dgTv1qvHSpNlKyyDvOsZzmiM/xBDACz0RHzOgERITcWvnN77ZcWS8Gho2vYOWSGAJDsUAHIpMLgHG1uQ0TPvXOp6eibCfEzdIFaT9gGq7mFsY8yR9kI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314058; c=relaxed/simple;
	bh=6fke3EwsxG8NMvqlrcUCxFwDBP5APob4U6Jq5qllugk=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:Date; b=t7E7WmLyFQOCL3tYPltge+s36GT119YfgsAZByeDjStqARnLp7/le5RyLIXJ2czY3q+liYLc3rYXE2q9DSFFZveBdw9xA2yWJX+e015hHmVw4whx1bz3b+oUzd4PEzsQQD1cBuLU1zbHc2Cp1N+MP4Jw0H99KXPPWzMz3C5Sv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=corfauth94@gmx.com header.b=IDVs/A7c; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1773314054; x=1773918854; i=corfauth94@gmx.com;
	bh=6fke3EwsxG8NMvqlrcUCxFwDBP5APob4U6Jq5qllugk=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=IDVs/A7cyjHTsvAsThTupVpPwkHtvE68bixQ1xuMCKcf9H/8Us7raCWr407h0U6S
	 5ADuwIGpeDupK3qde8COKULZ5EnQpmxBAev4lhRFuvsc4XqeVCbZWhakXoLgGvYc7
	 nee+qsQIx0a5OQUevwee1gLnzIJFXZALVtrbITwigI0zxniWLa8HQTWVOY7Oe/wtM
	 QEAYZ+yZKMVB9V1wu8rAsYGQIa8JLkbJcow1Ms5Yn3ikrY/k130ldtZZ7I37zbBte
	 8CSnrJZWr5LOq9psHcDRHEGXZ8cIuXevpbIcncageAqwtZP+W6cTvLT2M7Z/Gfs1F
	 IZ6wtnXMK60MdhIpeQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [95.181.238.184] ([95.181.238.184]) by
 trinity-msg-rest-gmx-gmx-live-8d9bc96fb-fztgb (via HTTP); Thu, 12 Mar 2026
 11:14:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-beac3353-5c32-443f-b6ab-7123bdee2f05-1773314054439@trinity-msg-rest-gmx-gmx-live-8d9bc96fb-z2wnl>
From: Cornelius Fauth <corfauth94@gmx.com>
To: linux-usb@vger.kernel.org
Subject: 59934705616082
Content-Type: text/plain; charset=UTF-8
Importance: normal
Sensitivity: Normal
Date: Thu, 12 Mar 2026 11:14:14 +0000
X-Priority: 3
X-Provags-ID: V03:K1:QiFi4VsRxn9txeaT5TST4NAEiD5I4qeTYcfOtKJol5qIBN0MQq0BjWujxXxPyUGYC8DtA
 wzp4LrJOJYHdHypSwgjm2JJ+iF8x83rZZ57gwkjLmbuYe1E7lagkLVXQ0KvyJhRnW6+AcO0tuGVw
 9mSpytpAcz4ManhuVr6r5gb2fXUblMznPiXrc94fFnXzNMXRRGdSuxYCwMo/ELdzcTt0pEVA5ZJb
 186u7Il1zVFU+cWwXbgXfEqe6G5oDnVBsmKLSnHSLiAMuKDme4jr/soeAYldH9nTcC6xS9k1Rb35
 MZ7V0lUOY5zyDgWaBqKFjXMZYoMhSEji2rfsb9Tt6c2h4ggl27lsAD8d1NdUrI6ncY=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cUkye3zJCww=;HAiD5llzprAtkUcHtqMjtEzRb9g
 opUtMcxpgYAKPCzMQSTcOJAjmJgTNb7+65qLrl/mXzGsuoBRP30o7LUp8CaTODe383baQmvf2
 omLVhCqV2Gj/AaAT1ZrcWuncXL3RPh2m7MaEbec1a9D7UAdKEbkQMxgXhIVpnz9Eu4xrdcCWZ
 5ur9uoPGOEwnRzKCHEfK7S2VQnaZy03v7Uk0rmQKUxZhQsgNWl3tCK6R9Qcu/GjolzBEWKVnn
 Wq7fP/+TZTG/8v9makXF7KQ6wk71RKfTCMyCtsEhrf8OH7OxlkCBd86oGttrZiNzSavY5eiGe
 GQ+l/Ot4hvQSN8PmYXBD1wJ+0WJSKzi8iW4CzyYcLnDtRJLpvCtT8dusY1Va7iThjWX1nW3to
 W4OlcIgSWjJtIiaAzczTQNOZV2Nl2xcllf/xOmkwwfiw2NMEJAGamnypOIk9Zu4WHmaWfb/1K
 G7zVzB+5WXwZ2vfpp8t5mD1O0Gm3LKlNkihf98+bL9qRKSe+0aNIvuGF6Jtv3N+LaX7T89zot
 eyy+RSi62k/zeJftiRU7BrZBBRHLH6niUeAIr0St1/FkzuWEzfMYJkDIsEL1pqoOHBQO/jukd
 BhHnc76t/qLaRZa8sTxqisJG9GpSQgsPN5JAVL+lbhmy/MIkS6uKs2VdpLLi/nXYQSW8EMSeD
 TVKcF3AIb3R2ONVqBT6fFuh+eyXiCD09kSIXd2RdJR5Rhz36lt/ic7ieZYONMj+KHmz5nO0GL
 SojGy87YdR1P35kLetZ6qSQ8dV8yjT2TIn/GcBYEb9YFXUqsCjHpkZowtj9PEM7P+5Ud5mP0x
 uZ1501J1MfPQsELPrB08lqTzR5Hslx25ePPuBEiDrhsZriuNp95g/7CZ5Akg/IKFtFlDl+SCU
 RXPPJdAwAWFv6pEUUDdoPFWcbLMY/kcs0M6AF9snWckMSoNq4DEZjuZ40E4HNKjxm52aZo/sZ
 U3kXqAtKRAVOJEldQnDUA1M1wBDm/dAFUlt9lVcgzhea41aL+EnCkLzZBwK5V+e7O/c/Mazxm
 0stChkya7cfRqxtAnR93hd+ITY5xx8SVMmZsvc8Q9eRW9fQq4ukosdZv3WsL6xy3N2DxXejqS
 wySv8CwJJ0zZHSSK3WEsCTLTJOJm2lXi8SgH+tNEKKWFQR3NS26GxmkboFowMTiHRjT7lQ1qg
 MYRtraCUmONbQ9GcQNIVJXwW57h1PYL7WGE1Fb6TP8DLMw7/y/+XSuueAbEX/POoJscBaiInY
 zsTZ50NtFZ5U6aKUqrznVmwo1ImHtbyE2cMexqFzZJyv3jux9ZcFAcyULPznWFJF4UNigHyMN
 K1ian/MwVI5h3PJR80Cg2vWNn/GSZN94wiEJa7o71ec7egWKnEksOYyGqQsN7r7/mTHNeSDd6
 k1hZF2gAGobATF4uvZiu6oipV+xNuspKcqgav6hXvHv4aJ7bdYFoemi5U2cauH4ZbGQFvBvwx
 GwAofXx43YVFSm0ufWe2mGFxu1xPAvCrlYui4ajpLv9HkksHjZlDcuwznatA/LVAXI9IaMBKh
 BvZimnhB7JxT+r8H45zDGXsXpPCBf5seaj65GyRnGUiDtZzJ82ZCH9kE547CATG+ri4d2IsXf
 M0BiRTjKKVGYGLFXGZvbvt6GoFxalenAlzxwFVn0zx3yXDPlNGnlstPWGP/WqtHO3u5Vt89t+
 bEKu8vJAyj0oMlNUZuu4Ebx13+mScd8C15jRNWU+zlZnlbI6j9fHJ9Sk6E4e6Ba4ub2l1y20A
 xAV/dsnHZZPAcb3LyRQVPiJTS17Ayy5FH/NmtYQ8CWcS75WIhGgazYMeXzB497IJY91yjaBNM
 Qqyvsu1iK3l3qvzq6x4Rb+FqCbVgrjinYawSfCHd4V1MmRfgnsqqGxRDwjrgzlK4+Tg6rsrXm
 UFr/AKbNTaPUMgWZ5iYleYwMihW0WcuzcyRsHA4mYqa26HI7sk0s2/I4DXQyp7Ag6/QdUNSDH
 5nQs6b7EP6osfst4WEhKD0bohDNhqv3/1YknkloNAvdso3DGM0ywuezh3poHTJgzstBv2gPLg
 l75jEmbA/Ays90DzP8wb9E8WGZ197ig+/7APfjh/bIGstq8kS9dMUTM7zv3tS3sDJIlI5eUaZ
 w8FvzBxCGPpbJhVL45YDy6SBVoNibXeU8CgN6QEQgyMJ70ub25G8qFtCNLLoi76SUNCjamezO
 n1x2cx112OrqFtetdbhUZ0hyWGJy3A6IA7icHgt+VxVw4pZRpzZfAMlIFtlaDJ0Mx+TNdlbAn
 /+Y6HJycdBoSf96z/iSZrnadFkIeyAGfyvKjNhY0Wvm1KQo+Ywok+h9il7F4bOy5SCuatWIxy
 7p1pU6kgn/qJnyU44Nnbh71MekkZvLF2Hzi/n/mtcZeR1s41ULKr+NFDHBsUYwYMkEi2gTwAX
 w6UjFxuS1QBJy3nqDWRfoB7rAN1g0hTO6Qe6HLo32sLmvxclgafzuoFHKs4/fiCHDCxlCaKTV
 IdXGEepIC0X40UkJB2TYP+b53Nh8V/GlFh2bF3wPeFhUb1aiA0F8Xj2yP1JyRVpQvGQ3giCQp
 lghz10L4tJHjO+vhlYgeah72Zz/768O6sJdl0Bow7Ktu2W9gvBag3YVhMLPC5/OC9aI4NRvnr
 MvK3U6qd6RaCX9Pa2QEztAaIfK5gpj5axgacXoLTJy2smtiV/Z3h36Bc2c4d9LDowwgMEuUc6
 2k9IsKLaJBtcTGX7W4gT6oEe6x1tQy35teJga+0KTFZP+zWkmo9jhbYHQnRfoQucB/XYvH2xi
 hM14jwT9l/kq6TUSX1xffYMY4WEmq/7sZi1y2KI/AykadbbUs0uEWHQo3lXTAdOO8pbiO0QDp
 vzoZ9hh6SiTgeMJLEmQ0UwafuXB+tKQFedVpsR2a+44ibsUBcjZHMWZruLfWse/uRPPfZhCkX
 xf7BWdO4j1hiKTvgDm7IF2b9wNPdDs19TQKe03SYFRj5N1SuCwQ5JDWHyEHB2pSVzP27IN/NL
 wWb6LLukIO1yYbMgtv+xKRXx6naBCy6bA8JUpGG3pFUaNI2eNwuUsbqQPdOfIwF8/ldNTQFxF
 CTpB9ik5XPR3cOz1NSgwNIpW5pqkxkzML1KJlO+pJQUna7otZ77kcSiq1kMkdULQ4fnJJHmop
 6AXZGk9lsD5l4Y5syY4ZI/XC7L9yNgc8IMqmrAGdVoVyc/wHLbvEJRgyXkYJllsmt8LymmKjO
 UKeQn/gECt0IWYB2k7gI6xTVcwf1KrgVk6lKFVZKpui8G21hklFnXZ2+jJRySt8VQz5bH5Ze1
 LcORibewRS44p4vFP4eQNsPaLLdXFFqyoDKQKNNhmeOTN4cOYCGlJpZ38FjIKyxzRvyklwGLm
 Tvkq+RG6gYyFrcUNouclNDp7HnluY9Lk7tVgGlmhQldmeO9CZbFnqgOvx/vE9Te8uKQrBkdRy
 +MW3ThFWWGEytUUcQZFFgXomZAPbWGPY/Z0AWB1NUFfExKOG7eob4BqPO4/7Isks497Czp6FS
 1ay4bRFw4MqdjmF3rESRseXRY/YaGoxG7is1w3gztCf0ySkbUkkj8NNDqo2GF5fXJ+5+ZarNt
 UR9Bf/Cv2s4DXULsMd8cWz+341AGdDaYNZulq6Q4E2aqPqQ4bZiMSFxv65sl+jfqGDblqE5LU
 VaEaxD9zk7VMh4ezL1EgNOsxsTragUq0eHwC99iXPCxF97UYnUtlYfZOeg5fbcFFbpMsNYqIW
 nlJ3kbWHcW80GDSOmBoNsj+8odVrHjw07yuv1YuBDpT7FdkSmwyBbDnVlgzrfjXN12Os3BZ1T
 bfPopQQXri51QRZBvZieaD2qkEqdcvybpHhVQFuQkQcIuN+67YeM4bGeqRknEwLhzh6ZwA+O/
 tzGLGOPxJYkZ48/KDhVs+nUQFfr1Vc8DA15UPZE7dgxNdV41jPM6dVUaB8AWBVAeUXSeWIYXs
 W79vvU0NBXe4ulzgkgun/fAZeqQfG/3+RUhplhS6F9Gc7ezD6Vn0z03E4oXXXCPZaCJJ3dGxx
 CPQu3FLwdNuQSi62eRuqZq22ID3hlmUaHaCymKJpaw/djEYjq3KzCqPffsK2ZzcncpPzJEuKA
 gSHaz/OyqNiFo/NFhdkT4iXiIuMOhokt2B3Ti1brj2icrLrZh9Oz0w/w2ulDIyXbSF1VhvQiy
 /g+omRUGMA7RISE5VX14WuP6Ghk6LxLy7BY05TYz2kFU2CDJoGwvhSXNUH7Jql7u6M9Be+guP
 Guig/KTCUZoiS/VGIsJ82dcCr5JBjEWWxtEXGjwLl1gL50f2EyR6pb4QQ05VQuqL80mMzjZIL
 l2EzQlxMcXxrQJnYwxhQG0YFQN+80uSHwDeekK6yCLphyYV7Z438YI1fDEv4wgL/ZwRCa1qv7
 euwr7gSmnTkS5drHwscPEuI3HT2TC2bV+n8Ni3wxMAI4fNZ9V3BMiNbo9ewToLFjHxDgl4rOI
 8V47CMW+L8YBuKAGmBelbK1yvUPntrUICF9S2Q8tgLGd50z7D2iSmg4BY+wVB84+/UWP3nGWe
 7UwJsr9T71+xBsmPb9RP/8BsTC5PmtdMOvP+3ptmZb67qmaPExOWEa/Dwc7QUSWUWGc7hSh9N
 1OAa5Ltp5hxbOlwloMMecPyKDlK+bSWadvOJeSALzkI2Cz6Qc33Vohlsn1oC+XY6RwNpqBPtj
 ofMlhXkJlqIs+0dz4J3B97i0FP6bAPbAlAGtBr4xZZBR0+Z5niF7L9Hd5as2CWM3GIAfwvfoW
 H0Jj4+ArE8Ho1unRzFUDejOlCIaw
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmx.com:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34676-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_X_PRIO_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmx.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corfauth94@gmx.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59C6D270B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

http://172.86.67.15
5780491190922250611

