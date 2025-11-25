Return-Path: <linux-usb+bounces-30898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709AC84822
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 11:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457893A317B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 10:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7119E30F95A;
	Tue, 25 Nov 2025 10:36:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F692EDD5D;
	Tue, 25 Nov 2025 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067015; cv=none; b=Tz/fK7FLPjIiHGJlAz/Xw4Za5amXYIOJgx1IPeEGB93i/bbKgklQW4yrn/Jm7AJCrtOnzwQCzBSZDBJHiNUU0xtR0EA7h5s5Z3QUbsUHtmVnV3TjHhWabGjsIG/kUlOJUAGuFIR9AQb4bkH5m69fZA6H4C55znKmIpY5BG+ac7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067015; c=relaxed/simple;
	bh=ro41/685eLAPeqKi0I3HlMhyRZdDa1TkqAwpKiiSDoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pQOHgn/pyCgHMcPTjxqmdhJfH56tls22yHhyGbeWdsmloUYZN4pwBdJyG+b1vPvyg1zTyrG0TotY+6qK183pXOclpgQpAS+DZjKIjlgfv5vffX2FdRmDywS/uohTBNumqjV76hK2pkU4pn2E4suSmLFFTbwk8UOG5CiiCOrI+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.18.214])
	by mtasvr (Coremail) with SMTP id _____wBXmVO0hiVpZlExAA--.13561S3;
	Tue, 25 Nov 2025 18:36:37 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.18.214])
	by mail-app4 (Coremail) with SMTP id zi_KCgCXeH+uhiVp0zl8Aw--.52409S2;
	Tue, 25 Nov 2025 18:36:35 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	mitltlatltl@gmail.com,
	linux-kernel@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH v2 0/2] usb: typec: ucsi: Fixes for Huawei Matebook E Go UCSI driver
Date: Tue, 25 Nov 2025 18:36:25 +0800
Message-Id: <cover.1764065838.git.duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgCXeH+uhiVp0zl8Aw--.52409S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIBAWkktQELkwAGsm
X-CM-DELIVERINFO: =?B?5AejfQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR18YlAikpI5poxpx6509tfGu9da9Wka7f9o9Eh9gF6MAz4r+82YrpXaru1LtdjTFa9AMK
	1nSaSV4ci93tEAf+x+usa4vHYcAbvr5/yJ0bf8ECuQPco+AnQ9yOOpoFoSkJbQ==
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1rtF4kuF4xKw43CFWrXrc_yoW3trg_ua
	4kKrWxuw1UJFs2ya1UWF43Zrs0grW5Zw4kAr45tFs3W34UAF43AFsrK345XryfGrsFyr13
	A3Z2v34av3WfGosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbskYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU7xwIDUUUU

This patch series addresses two critical issues in the Huawei Matebook E Go
UCSI driver that were preventing proper functionality and causing potential
use-after-free scenarios.

The first patch fixes a probe failure by adding the missing poll_cci to the
UCSI operations structure, which is required by the UCSI core for proper
initialization.

The second patch resolves use-after-free vulnerabilities where a delayed
work item could access freed memory after device or module removal, by
ensuring proper cancellation of the work item in gaokun_ucsi_remove().

Duoming Zhou (2):
  usb: typec: ucsi: fix probe failure in gaokun_ucsi_probe()
  usb: typec: ucsi: fix use-after-free caused by uec->work

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


