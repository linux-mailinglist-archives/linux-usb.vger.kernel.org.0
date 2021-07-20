Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9603CF551
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 09:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbhGTGvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 02:51:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232391AbhGTGvk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 02:51:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C5D561165;
        Tue, 20 Jul 2021 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626766339;
        bh=TtvpaEMsR3u6EKkMoDAPlGks7XH8v1RQa5GXSq+xLzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hzGV7n6Vb2Kk2wd7nEyRxlpj31JiqUtV7JxckRkQ/BH0ePMyCA47cZnE9ZfTpP6ms
         DbjweKsg3027diPn/JoiokG33elbsrq5eGrkfF4DDgF7JAsGIGk1d/x0Bh2zeEOUCp
         GtJM1sC/KSDLa3KDNNF1q5yDW+Spd4NxR9an2O9BLcumnDNPEK+fVLJ/DQqxTYj0wS
         dg83oBPbZVURfYfQydVvsmAQ/mtny+ALw3A/RaMJcy7UqBvBfnGbgM/ias/YedC8Xa
         I0sZtZFssaNYhesS9H6UCCciowXUMH8NRRSTaaGpMeTrOkhlKFh5Q8OA55O3ThqlgK
         eTuxx3GvPWKPQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m5kEL-00079E-Eq; Tue, 20 Jul 2021 09:31:53 +0200
Date:   Tue, 20 Jul 2021 09:31:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH] USB: serial: cp210x: fix comments for GE CS1000
Message-ID: <YPZ76YwLdm/0heDz@hovoldconsulting.com>
References: <20210719164349.137402-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719164349.137402-1-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 19, 2021 at 06:43:49PM +0200, Sebastian Reichel wrote:
> From: Ian Ray <ian.ray@ge.com>
> 
> Fix comments for GE CS1000 CP210x USB ID assignments.
> 
> Fixes: 42213a0190b5 ("USB: serial: cp210x: add some more GE USB IDs")
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Now applied with a stable tag to make it easier for the stable
maintainers. Thanks.

Johan
