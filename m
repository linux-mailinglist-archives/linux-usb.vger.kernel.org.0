Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC10F1D9B74
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 17:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgESPjy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 11:39:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:52068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgESPjy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 11:39:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 39292ADFF;
        Tue, 19 May 2020 15:39:56 +0000 (UTC)
Message-ID: <1589902789.6470.8.camel@suse.com>
Subject: question on tty_operations->flush_char()
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 19 May 2020 17:39:49 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

is the flush_char() opertion of tty_operations allowed to sleep?

	Regards
		Oliver

