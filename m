Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11CCA5395DC
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 20:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346816AbiEaSGU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 14:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346014AbiEaSGT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 14:06:19 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8911E85EE4
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=bM+v0cuzWPnPeBa6OogQD6DSUxz3WdXkviU68+bBlIQ=; b=veDCK
        uWOhXhx2jQc5Xao90ut/7uJekHyyUnDpgtEG8IhGSYrC0pdDRp6ZIGNjGTHj+GGN90tpsURlK8u60
        UUA5spiWyBkh6+ryIoDJJHLCx2/RRQmLPHgpz0unJqJH19AEfoX1WwxjlDWcRgArhF6SJsKQCl/6r
        jD42XNJBeVt3p6arwrdGYbA8ssig3zW0EXJZfXiZx64K2txVbxk+gVm59/sfxefVFROZZPYJzisLm
        tl3ZstmdRCqcryJK9N1J7mzYiPW5e85dFYXkPl8dXhFkthM3kQ7aKIGWIW4+AG4A/qwEXl1Xc8omt
        6KsauGaGorgo/U/An+HDFgRk0qJ7w==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1nw6Fs-0004q7-N7; Tue, 31 May 2022 19:06:08 +0100
Date:   Tue, 31 May 2022 19:06:07 +0100
From:   John Keeping <john@metanate.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Michael Wu <michael@allwinnertech.com>
Subject: Re: [PATCH v2 1/2] usb: gadget: f_fs: change ep->status safe in
 ffs_epfile_io()
Message-ID: <YpZZD/l1/hDXIqde@donbot>
References: <1654006119-23869-1-git-send-email-quic_linyyuan@quicinc.com>
 <1654006119-23869-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654006119-23869-2-git-send-email-quic_linyyuan@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 31, 2022 at 10:08:38PM +0800, Linyu Yuan wrote:
> If a task read/write data in blocking mode, it will wait the completion
> in ffs_epfile_io(), if function unbind occurs, ffs_func_unbind() will
> kfree ffs ep, once the task wake up, it still dereference the ffs ep to
> obtain the request status.
> 
> Fix it by moving the request status to io_data which is stack-safe.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Reviewed-by: John Keeping <john@metanate.com>
