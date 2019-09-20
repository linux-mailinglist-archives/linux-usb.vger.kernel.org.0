Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F99CB8D49
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437890AbfITI4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:56:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:51308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437888AbfITI4B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Sep 2019 04:56:01 -0400
Received: from localhost (unknown [89.205.140.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F2E1205F4;
        Fri, 20 Sep 2019 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568969759;
        bh=Q5DBCvXfGxkSWp7t0E5MyVCnXuqkOqtHcorvx5tiz6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jMjB0evBO1gYwzHqR9D/GT2zZirLQ6KCRiqdO6IZ4bsTZo71nbwabZviicEdNUxHy
         mFlJSOw8sO3h8/Nm+EyAv4QtOcfabzH+MWbJEr3X2Lo3eymiwX6I2/URJQ8e1xBfcl
         9mIL1NOq+wP0BaXhniiQsRQ/dyIsBtZUtlr63buQ=
Date:   Fri, 20 Sep 2019 10:55:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190920085556.GB521576@kroah.com>
References: <20190920103628.5432-1-heinzelmann.david@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920103628.5432-1-heinzelmann.david@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 12:36:28PM +0200, David Heinzelmann wrote:
> When a port connection-change occurs the hub driver tries to resuscitate an existing device.
> Activated from a firmware download a usb device can re-enumerate with new or changed device
> descriptors. Therefore it will be checked for changed device descriptors before the connection
> is resuscitated and the connection-change event is ignored.

Please wrap your lines at 72 columns :(

Anyway, what problem are you trying to solve here?  What is broken with
how things work today?  Are you trying to ignore a change that is
currently showing up as a change, or trying to do the opposite?

thanks,

greg k-h
