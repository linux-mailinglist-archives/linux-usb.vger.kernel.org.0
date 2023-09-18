Return-Path: <linux-usb+bounces-328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B767A4C33
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 17:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F44E1C2083C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 15:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95571D6B7;
	Mon, 18 Sep 2023 15:28:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001D1D6B2
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 15:28:36 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1DC12A;
	Mon, 18 Sep 2023 08:26:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9761FF93;
	Mon, 18 Sep 2023 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695050653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTsaizh9uJKTEcz6c5p2g2QGw5JzmlLl2sAISOCHTb0=;
	b=uNDNyyEycKJBCT8u9QqHT2QXUZQSV7KEwqPhRKMT8g78tvewNow7/PM0Dx8tyzi3UtSwzx
	cITrOJ3w7steQa1htyVtogiSbMXtJDg/hwSQ96Jf43HJYSsCYwhj25c8Sf6DEVuyfURH1Y
	aU9810o4zzQKZkEvrA6beovh34oBypU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A48001358A;
	Mon, 18 Sep 2023 15:24:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7NFIJ5xrCGVOWQAAMHmgww
	(envelope-from <mkoutny@suse.com>); Mon, 18 Sep 2023 15:24:12 +0000
Date: Mon, 18 Sep 2023 17:24:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
	Tejun Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH 15/19] kernfs: split ->kill_sb
Message-ID: <vqax7efvf5h4agxge5g43pdl6tsa5on5mob74bydydd5vdxwb5@5fj2qgmuxjj3>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-16-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fb5cgu6m55xbwjgl"
Content-Disposition: inline
In-Reply-To: <20230913111013.77623-16-hch@lst.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--fb5cgu6m55xbwjgl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 08:10:09AM -0300, Christoph Hellwig <hch@lst.de> wr=
ote:
> Split the kernfs_kill_sb helper into helpers for the new split
> shutdown_sb and free_sb methods.  Note that resctrl has very odd
> locking in ->kill_sb, so this commit only releases the locking
> acquired in rdt_shutdown_sb in rdt_free_sb.  This is not very good
> code and relies on ->shutdown_sb and ->free_sb to always be called
> in pairs, which it currently is.  The next commit will try to clean
> this up.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 12 +++++++++---
>  fs/kernfs/mount.c                      | 18 ++++++++----------
>  fs/sysfs/mount.c                       |  7 ++++---
>  include/linux/kernfs.h                 |  5 ++---
>  kernel/cgroup/cgroup.c                 | 10 ++++++----
>  5 files changed, 29 insertions(+), 23 deletions(-)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

(Also, I didn't find a necessity to have kernfs_free_sb(sb) under
rdtgroup_mutex, so folding the following patch of the series may be fine
too.)


--fb5cgu6m55xbwjgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQpEWyjXuwGT2dDBqAGvrMr/1gcjgUCZQhrmQAKCRAGvrMr/1gc
joA0AQCDANwuvql51NVbMvBdMPjFI6Th8lDr5goiUMJIkDInfAEAgIpZtJp32qUD
1HpNpPzzwxVHRHauSQjOpc8j5wdn+Qk=
=yjqf
-----END PGP SIGNATURE-----

--fb5cgu6m55xbwjgl--

