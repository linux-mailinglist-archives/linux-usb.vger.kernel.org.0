Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E9F14972
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfEFMWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:22:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbfEFMWH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 08:22:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1625206BF;
        Mon,  6 May 2019 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557145327;
        bh=IFXYMfOhxhW377isDWb+5E8VDZ6KQuqjiGPTOV5+cZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCjlGyh08pYLw0CwRx64vWhw73X6DGc9DXB600WTrZuAVqZrj5TffFNlVTzvYDRlt
         ds1ztjqewljKL1ieWMPDQviiomeYy2xhjcwycEvIKxkgD8WlDJhb+cwVuh2A6+DaYp
         +v6iqwqcDRiLzuIgtrUYy5HlzaZ52bBJOfRgk4a8=
Date:   Mon, 6 May 2019 14:22:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 18/34] lsusb.py: use 'elif' where suitable
Message-ID: <20190506122204.GA24747@kroah.com>
References: <20190506090241.169665-1-grawity@gmail.com>
 <20190506090241.169665-19-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506090241.169665-19-grawity@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 12:02:25PM +0300, Mantas Mikulėnas wrote:
> Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
> ---
>  lsusb.py.in | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/lsusb.py.in b/lsusb.py.in
> index f19401c..74d8c8d 100644
> --- a/lsusb.py.in
> +++ b/lsusb.py.in
> @@ -12,7 +12,10 @@
>  
>  # Py2 compat
>  from __future__ import print_function
> -import os, sys, re, getopt
> +import getopt
> +import os
> +import re
> +import sys
>  
>  # Global options
>  showint = False

That change wasn't part of the "elif" changes, but it's ok, you've done
a lot here :)

