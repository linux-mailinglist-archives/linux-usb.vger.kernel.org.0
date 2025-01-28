Return-Path: <linux-usb+bounces-19794-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29912A2023F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 01:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ADCB16590F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 00:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA2218BBB9;
	Tue, 28 Jan 2025 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLABo9yZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DE29D0C;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=hCdvw3nh0zghwTNzJuTFLz0p5PiwA+g8bGuqP0AZPpcGg+2WHQ8LCzhUt93Z/RJevXAUQsxYVRVjLGayssm37XPj4fqpEmsoctE8/F/ekmXDGGYsIachlDq1/vDfL76p7x2M817G0IR5f2CxflDD/YuimveLBdykwzczyH9CciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=jccSIU0oVQ+cUZk0PyT/X/eDo6j67p5MwmFseC4sEcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeM0Gkskm0rb1+kgpV/gA4V6w6ECbulj0VJmPkS3wtA5JT95G4BSIwvIIhdbp6/EwdWEJoV5uekbXNKzYTGYb6cDBL5U3a80qrobpK+MDO26WG/UqKQjEdzUEqMMZPZVUfu+1hWjDqSNOU5NSsmsdDf9NWOpZ6Gz6nmsVVvhG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLABo9yZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288B8C4AF16;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=jccSIU0oVQ+cUZk0PyT/X/eDo6j67p5MwmFseC4sEcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLABo9yZoHOvKnzZUQtxxrEr9SnP73U360OfsxNJzlI1dhsPdLTKQw9kt0Eh0zNhh
	 pge3EMH6uewJ+YWX6Q2HCeEncWOciPf5Or32/K2fPaJZeEr6nJZOYJBu3qSzlILHIn
	 BeLgEGkYYow7mFxBCIYNwe6rDn9v4pTGX48BFOwnmh6v3nVJxLqXql3ZJzFd4dM+UO
	 zNhK0X1/7QPqt0MAhvsZzvH1ilpOof6KUmj2PivUGHSy7CZCEx4V0DIpgaYeeNkLjH
	 HMR3qSX7nHRb0sFa+JHH7sofBrr7QJffXJnaZmCVtpgEdSbuq7I3wiH/yJatYET6hU
	 8IsU13RupORHQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMF-1Rvo;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [RFC v2 29/38] docs: thunderbolt: Allow creating cross-references for ABI
Date: Tue, 28 Jan 2025 01:06:18 +0100
Message-ID: <3895db4d11575b2d3e98b066a35498aeadf749dd.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the corresponding ABI file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/thunderbolt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 2ed79f41a411..d0502691dfa1 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -28,7 +28,7 @@ should be a userspace tool that handles all the low-level details, keeps
 a database of the authorized devices and prompts users for new connections.
 
 More details about the sysfs interface for Thunderbolt devices can be
-found in ``Documentation/ABI/testing/sysfs-bus-thunderbolt``.
+found in Documentation/ABI/testing/sysfs-bus-thunderbolt.
 
 Those users who just want to connect any device without any sort of
 manual work can add following line to
-- 
2.48.1


