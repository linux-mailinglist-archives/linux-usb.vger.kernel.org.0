Return-Path: <linux-usb+bounces-6800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24C85BFDC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 16:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EBDE1C21249
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 15:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DE876037;
	Tue, 20 Feb 2024 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DoJL0ty+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AB7602F
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708442948; cv=none; b=fuc8oYNefmQPkn5gY9uJfAXp6KeOjrhn20RMbKsAn9q5qzWTuOzNyX34+KntnYtFYA9qK0awEDvfmH+PJp4hadkSPfisAJcKuM6sT3dSSmxhq4adpx2oQV54knFfskznEVph6OzF+3wXhOzX9NLnSsanTcgCSJMP0a7tez7O80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708442948; c=relaxed/simple;
	bh=FiM3UpTVz0lGJWzAVvP3O0YeKEzl10gfCxJvaSloIXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UxyRqwPQAmLJjXF/Qjhpe07Tqiz4L09uAXYqU9CEp6ZfXEz6hnv1bGx5eGv9X8XdFhgamYriMhVtr2x9X0I7KyVRPrWcD7mpkXqB+6swfVbh7Cb+JqJfBkmQXgvilfzHrSpYbBEmJRIOP+a5m6Mfc50oebexEDintFN4qXe1oKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DoJL0ty+; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708442944; x=1739978944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j1O/ASo0QfZWoIXI4aeD2H/NVFW1/L3uyq4RXkiITDc=;
  b=DoJL0ty+WQl0x8VghudEPC/cCF/AFzkyAxv84yj3YiWFtRn8f+r9qKRL
   Rwt6d6me0Nnop2BJyclG1hNR5XDfYFfU0YK50nzqt0ffC88U/lYK0YjMT
   6eZebKZv9JZ2j4MEpKfo47fwyGzoAm+DfnCvmnebkPCg6JHM7q5oDcsx/
   xHf5DWe5HKwIUdw/fq3VJp3izs8LrANPGEKJxRwVZTOGaMChJHnLXGuz2
   tCcT0NeX+743YC00lcUT1LtnkA4hY0KMyqaDWT1T+7LGh7Ah9lpsedYTi
   k7CklCLWL3d0Zr6cQp7cM4ao/p5rC7hpER5eREBk/qg/B5vwqb6BYewY+
   A==;
X-IronPort-AV: E=Sophos;i="6.06,174,1705359600"; 
   d="scan'208";a="35503897"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Feb 2024 16:29:01 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A042C280075;
	Tue, 20 Feb 2024 16:29:01 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: usb-next tree has patch applied twice
Date: Tue, 20 Feb 2024 16:29:04 +0100
Message-ID: <3469745.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Greg,

on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus supply
has been applied twice:
* 03e607cbb2931374db1825f371e9c7f28526d3f4
* 75fd6485cccef269ac9eb3b71cf56753341195ef

causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB phy:
[   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not get vbus=
 regulator
[   11.017817] usb_phy_generic: probe of usbphynop1 failed with error -1

Reverting/removing the patch fix my problem.

Thanks
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/driv=
ers/usb/phy?h=3Dusb-next
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



