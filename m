Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2500021A44D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 18:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGIQDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 12:03:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgGIQDo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 12:03:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E249F2077D;
        Thu,  9 Jul 2020 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594310623;
        bh=/qLNuerTrwjG6/a+LKc0jo1uZ+W04mB+ZjwvV2kkSCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lAhqAzI4FjFgBF+ER82NIQbWhUGvE0O7C0dwzuNitVHpFXVkZTb/XUuKLQ9WHgAnF
         Rc2CBBUoVzUizrlSTteq1DZKflVwbgzPGQgjW2S+/ff8H+WV4wxr0p4j27ziRz5p+p
         UQRpUf29hGcYGnuBGKO/ztuF2YdlG1OXpk7eI7VI=
Date:   Thu, 9 Jul 2020 18:03:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Remove documentation line that adds nothing and
 sounds condescending.
Message-ID: <20200709160349.GA863447@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706224415.2854-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706224415.2854-1-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 11:44:14PM +0100, Diego Elio Pettenò wrote:
> "Easy" is a subjective term, and while not adding more context, it can push
> away some of the readers.
> 
> Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>

Nit, your subject line needs "USB: usbmon:" in it, and please cc: the
proper people that get_maintainer.pl asks you to.

thanks,

greg k-h
