Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2827686BA0
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 22:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732375AbfHHUfs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 16:35:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37716 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727649AbfHHUfs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 16:35:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0082F307CDE7;
        Thu,  8 Aug 2019 20:35:48 +0000 (UTC)
Received: from lembas.zaitcev.lan (ovpn-116-159.phx2.redhat.com [10.3.116.159])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD38A5D784;
        Thu,  8 Aug 2019 20:35:47 +0000 (UTC)
Date:   Thu, 8 Aug 2019 15:35:47 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/12] USB: usblp: convert to use dev_groups
Message-ID: <20190808153547.6c6df050@lembas.zaitcev.lan>
In-Reply-To: <20190806144502.17792-6-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
        <20190806144502.17792-6-gregkh@linuxfoundation.org>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 20:35:48 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue,  6 Aug 2019 16:44:55 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> Cc: Pete Zaitcev <zaitcev@redhat.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>

Always hated that irregular error unrolling, but was too lazy to fix it.

-- Pete
