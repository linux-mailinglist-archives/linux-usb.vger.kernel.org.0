Return-Path: <linux-usb+bounces-165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC57A2134
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7EC2833E1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB4F30D01;
	Fri, 15 Sep 2023 14:40:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2F30CEB
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6453C433C9;
	Fri, 15 Sep 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694788814;
	bh=PvlOjbLkc3tgSHNCaVnS82ty1H0lvym1p0dyZTkOFDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsMXd6mZ8RM6Ehv3+oeXSFdJBK4XfA1s5jG3qJW397E3aH+o329rZ/VtgcJhEI2Ek
	 GIJfdrxXDV/D+2h214W5hbDliVTBm3yN1eUgvtUVVZ1/ZgLJyELtBnprCB74Mvp2bO
	 Y9yAjyDUJYhLQ2LABIiRFS7SjQAloadGL5GvZIH6h3ow+QooG9ilUBP37mYSe/gnfx
	 Oe0um8v+i1YG5HcXkyDRJwPVS8rwGOnzAUkEZB8JlS5KwPI8HWoWokIviZ30JYSJLI
	 VjWkPZQ6+IEwE3hlmnfM8EB719A4Al+/b90kwWaliUnxciX021zodiQcb+zRxyFzBc
	 v2OPDzI9ovPwA==
Date: Fri, 15 Sep 2023 16:40:06 +0200
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, Kees Cook <keescook@chromium.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-hardening@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH 03/19] fs: release anon dev_t in deactivate_locked_super
Message-ID: <20230915-brust-gratis-156b7572a7c9@brauner>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-4-hch@lst.de>
 <20230913232712.GC800259@ZenIV>
 <20230914023705.GH800259@ZenIV>
 <20230914053843.GI800259@ZenIV>
 <20230914-munkeln-pelzmantel-3e3a761acb72@brauner>
 <20230914165805.GJ800259@ZenIV>
 <20230915-elstern-etatplanung-906c6780af19@brauner>
 <20230915-zweit-frech-0e06394208a3@brauner>
 <20230915142814.GL800259@ZenIV>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915142814.GL800259@ZenIV>

> Lifetime rules for fs-private parts of superblock are really private to

Fine, I'll drop that. It's still correct that a filesystem needs to take
care when it frees sb->s_fs_info. See the RCU fun you just encountered.



