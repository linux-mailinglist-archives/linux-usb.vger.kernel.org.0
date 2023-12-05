Return-Path: <linux-usb+bounces-3739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7758056D5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 15:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFE2281CDC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 14:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463BB61FC2;
	Tue,  5 Dec 2023 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBqoUcG1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626961FB0
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 14:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBBCC433C7;
	Tue,  5 Dec 2023 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701785367;
	bh=zs/eMd88+gmmQRjUvcHkcoCYPI4L0Dw/e1tToZkeGMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qBqoUcG1F9QafYcLtATQFwFvTjfacezx+nVUGTQsISkgU1nMRmiMcX2MkvjYCZRj5
	 mQowI6duEjfTHH0iR8M5qbhPOo8UuRjJ4Wb0wLkp3Wr+MNL3YEKdyoRT/2h4myebrS
	 ZvuRAOJ/wslBIbqFS20ixZGUMIf3OSqfxT0iCWh+FGyRzXpJFD7rQ20Z+2NAZrhD0X
	 5wKZ/ioqRZ3bVQ6buS4cGlANFO6/ArT6Kzb5gXxLjNWRbSqQDC5K62ORZuUU1M1usH
	 297UgiQ3Vc/f6b75wudcgDQ3rPyqVrhjQ39YQ8nlHptU9nQNgqeGyVHLOq9XZ/jkYi
	 l5EKkn8sSXjlg==
Date: Tue, 5 Dec 2023 21:56:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu jicong <jiconglu58@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] usb: dwc3: don't reset device side if dwc3 was
 configured as host-only
Message-ID: <ZW8sJoTEKVmDdk5Y@xhacker>
References: <20231116174206.1a823aa3@kmaincent-XPS-13-7390>
 <20231116175959.71f5d060@kmaincent-XPS-13-7390>
 <20231117014038.kbcfnpiefferqomk@synopsys.com>
 <20231117015527.jqoh6i3n4ywg7qui@synopsys.com>
 <20231121104917.0fd67952@kmaincent-XPS-13-7390>
 <20231201100954.597bb6de@kmaincent-XPS-13-7390>
 <20231202002625.ujvqghwm42aabc2f@synopsys.com>
 <20231205012745.nt5gxlim6gljpi36@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205012745.nt5gxlim6gljpi36@synopsys.com>

On Tue, Dec 05, 2023 at 01:27:56AM +0000, Thinh Nguyen wrote:
> 
> On Sat, Dec 02, 2023, Thinh Nguyen wrote:
> > 
> > Hi Lisheng,
> 
> Typo, I mean Jisheng.

Hi Thinh

> 
> > 
> > Did you see any reported issue before your change were applied? If not,
> > perhaps we should revert the changes related to soft-reset for this.
> > 

It seems this patch brings more issues than solved, I think reverting it is
better. 

Thanks

