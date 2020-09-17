Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD27B26D85E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIQKGd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:37600 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgIQKGa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=MsDbMDupjzvJTNJ0tnARLc/+ZQwcxTlrPvXqBn6NQ6Y=;
        b=PfA2Cixh2//H8Sg6u5j/cvCcqwvn//ZMh/w/sfHZmkMad+vwPPeBvQ2o+7so3akhMDL/2w
        aG6cETCRJv4i/mUxUfIu72Pb34oqRzXBTxiNMc2G6f75ere4NThoq7B50+65a3bitVmKGa
        2AxgA2tzJM+2GrcgXRAeobLRMkr8iXlrGHQBRQDU410wgRffiZYizdmwJ8K/JbZSuB0b0I
        AgtZ45iVEqG6gTaq+abwDwC1LN6bckYrH1+51sSYp2dRQzmbnMoFq695JemG/X7xCs2shy
        AwdClnj6ikiyUcH5pTH867b9ssdbUyt0e4AueMDUcPj2OX9Q3rccJU+pjy5qIg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5198CACDB;
        Thu, 17 Sep 2020 10:07:02 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: [RFC] fix CDC-WDM in multithreaded environment and improve
Date:   Thu, 17 Sep 2020 12:06:07 +0200
Message-Id: <20200917100614.1010-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This set of patches fixes errors seen in multithreaded environments and
improves error reporting greatly

