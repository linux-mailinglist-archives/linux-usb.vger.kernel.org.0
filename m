Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C204717D
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2019 19:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfFORzI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jun 2019 13:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:41740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfFORzH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 Jun 2019 13:55:07 -0400
Subject: Re: [GIT PULL] USB fixes for 5.2-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560621306;
        bh=CA6qax+LZQSfbA3Nv9S7rXdp4xUGXGlahHUXFbBpPVw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=o8pMDLsHGbIQJ5LbZTS48lcw4WlKG+EDvp/E4l1218Mehwn2U5sGBJeE8swHE8/m9
         wjkXPM4pmvKO3kCULSH+x05ZxcgGXWk74l6295ajzWoAmtoaAeNCCvqyMS4rVA7c2l
         lL4iWwjkCCy7D5zSufhjXeCdUxZ0ItENHgAuCQIU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190615154845.GA6603@kroah.com>
References: <20190615154845.GA6603@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190615154845.GA6603@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.2-rc5
X-PR-Tracked-Commit-Id: 5f54a85db5df67df8161739a4b2f9c2b7ab219fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff39074b1d4e727c299ccfd1588f9cca17a59c86
Message-Id: <156062130668.5191.12217177123386573904.pr-tracker-bot@kernel.org>
Date:   Sat, 15 Jun 2019 17:55:06 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 15 Jun 2019 17:48:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff39074b1d4e727c299ccfd1588f9cca17a59c86

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
