Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0953531BA
	for <lists+linux-usb@lfdr.de>; Sat,  3 Apr 2021 02:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhDCAKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Apr 2021 20:10:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234161AbhDCAKR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Apr 2021 20:10:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9AD161186;
        Sat,  3 Apr 2021 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617408615;
        bh=HJB1KLh6ExtvnemceXGXbKJh75xaE2t7O731lpCdsws=;
        h=Date:From:To:Cc:Subject:From;
        b=gtN6mjjz+LJ/NZhLoecZ7ctcyLOJ/yCcKQeWl5L7ZOOqJa0gZHwKBPN5m6QXMFoOL
         oQpkJGwxoI+Y4bT19eIL0CcgBhfxJhnKDQVASRkdzViY1FoDOtJZizSzvmuOJTDriU
         t+w4qJw4dsTDhl73tgsdHIoLQYFVe0ajljoLi5N+knmBY1PmzFqgzl5eTevLPKg3rM
         xKjx8tTKjDd+glRmmCUd4wTk0J1aEGkdGWOLHw7k7FHQDtptlqYYtEwsfLgR6X+Vvv
         QNn/0XzpuPGFmbKMZCn7o2dU7C08azAD6yHNEdIiL95eR3Z37xwJQreNST5rbGZImY
         pxnk5UICzTDOg==
Date:   Sat, 3 Apr 2021 08:10:12 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.12
Message-ID: <20210403001012.GB18389@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit cf97d7af246831ea23c216f17205f91319afc85f:

  usb: cdnsp: Fixes issue with dequeuing requests after disabling endpoint (2021-03-27 08:59:46 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/v5.12-rc5

for you to fetch changes up to cf97d7af246831ea23c216f17205f91319afc85f:

  usb: cdnsp: Fixes issue with dequeuing requests after disabling endpoint (2021-03-27 08:59:46 +0800)

----------------------------------------------------------------
Fixes one issue with dequeuing requests after disabling endpoint for cdnsp udc driver

----------------------------------------------------------------

-- 

Thanks,
Peter Chen

