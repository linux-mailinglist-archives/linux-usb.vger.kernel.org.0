Return-Path: <linux-usb+bounces-17352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D59C1704
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 08:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D31631F228A0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 07:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F711D12E9;
	Fri,  8 Nov 2024 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joyXziQv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03C7462;
	Fri,  8 Nov 2024 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731051034; cv=none; b=ZaJS1NlGZ4A1QfMa/74v77u5HH89WYnPo0DQPo1w8r56nLm4mO1qVO0ZBi1VVcL8b7rltc7SqO7dhucyW0VS3gAqmHwNDh1JfKtvSOGgrfEYImbys49fM9yIbtVZug98vQFsGki7oxJZLDjCv/HHj0/6CXuak7JusojSQoOK5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731051034; c=relaxed/simple;
	bh=5v7MNqRNOR8cad3VCYUW+O5SEBXDlgYDMTTYupbOBnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMNuydjibQo9VWncWpv57KhWfL3wzgK7NI0NdSxL3rSD6u0Uhr9livlWI4DK3xOPBXOghmI1ppcxfvKlTbpk/t6aUYnjaCrw/gswQjQKFJC4droekSemacqwXUR0GmzffLkALfHy59EvMIUCsHYNT9leMYTlq17fOWa6kwPsFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joyXziQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD16C4CECE;
	Fri,  8 Nov 2024 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731051034;
	bh=5v7MNqRNOR8cad3VCYUW+O5SEBXDlgYDMTTYupbOBnY=;
	h=Date:From:To:Cc:Subject:From;
	b=joyXziQvPKIPSFoPbqZvqr5JbF2SA7Fe273S8+Fhd8dRCEEsEtcHDZqfi/xvZ0Qk0
	 /vWf/XYE/wkAvs2mk4VwM3w1ovmxA2HyFTztItcOxZQucqca3ImN9KaCOcfuPt+1D0
	 cLjHDum4C0qY/v2bBVMuxU+UePX7rK99OabUi1+DKkzWLs+HjDdQhlN/zrtGFybpg+
	 8cOT8ZvioMIVDaEI5qU4u3f+cDXEtsqsx0IFMZg9Nm6mtSTlaFLVM3rFZ5aUV96SIC
	 AZwaHKm10UoQNTrl+h2ju128msdo3niOVMVSqhvJIWtMCacAnKldb7JYhFliaNX9PF
	 NBqqXdxZ08TUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9JRz-000000005rv-43CB;
	Fri, 08 Nov 2024 08:30:36 +0100
Date: Fri, 8 Nov 2024 08:30:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 6.12-rc7
Message-ID: <Zy2-G5Q_9ECZsu9q@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.12-rc7

for you to fetch changes up to 25eb47eed52979c2f5eee3f37e6c67714e02c49c:

  USB: serial: qcserial: add support for Sierra Wireless EM86xx (2024-11-06 15:09:51 +0100)

----------------------------------------------------------------
USB-serial fixes for 6.12-rc7

Here's a fix for a long-standing use-after-free in an io_edgeport debug
printk and some new modem device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Benoît Monin (1):
      USB: serial: option: add Quectel RG650V

Dan Carpenter (1):
      USB: serial: io_edgeport: fix use after free in debug printk

Jack Wu (1):
      USB: serial: qcserial: add support for Sierra Wireless EM86xx

Reinhard Speyerer (1):
      USB: serial: option: add Fibocom FG132 0x0112 composition

 drivers/usb/serial/io_edgeport.c | 8 ++++----
 drivers/usb/serial/option.c      | 6 ++++++
 drivers/usb/serial/qcserial.c    | 2 ++
 3 files changed, 12 insertions(+), 4 deletions(-)

