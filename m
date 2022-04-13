Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2209B4FF584
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 13:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbiDMLPc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 07:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiDMLPb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 07:15:31 -0400
Received: from fx408.security-mail.net (smtpout140.security-mail.net [85.31.212.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57E548329
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 04:13:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx408.security-mail.net (Postfix) with ESMTP id C7BF71B7B14D
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 13:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649848386;
        bh=9+II1joWUflGCWg1+eKfQCVVTfrt64iTzI2vrxxAZ0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=VevlYHLpz+x4vM5iQbN0q2d952ATMkgDbIcAu+FoI+2Nqx93MaEDve2VVMxEXKt1z
         iC1Ms1U11FSUdMwVtAujiUyd0JkfhKyP5ROMg8ym3La0VXrETk3zcdXa2wG32L+AEp
         /4PtmGAb5NNDbGTyKWFrR9OddsMDZs9tj5k2ATho=
Received: from fx408 (localhost [127.0.0.1]) by fx408.security-mail.net
 (Postfix) with ESMTP id DE1B81B7AC10; Wed, 13 Apr 2022 13:13:05 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 52CE51B7ABF8; Wed, 13 Apr
 2022 13:13:05 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 03E4727E045B; Wed, 13 Apr 2022
 13:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id DE06A27E045F; Wed, 13 Apr 2022 13:13:04 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 ugWeVI7OodDm; Wed, 13 Apr 2022 13:13:04 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id C2A2027E045B; Wed, 13 Apr 2022
 13:13:04 +0200 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <f1f2.6256b041.2221c.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DE06A27E045F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649848384;
 bh=soPa2qoAVFoq47iDh1+vjH0I9npC6QTDJJCXeYNmh1U=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=VG1WZaQZca3Ohex7w+r4KKA3br7IX63IaWDilqQR4RnCv2dfEZUPs3W5wolbKcfRg
 I6mWp0bueoeLY4uPeDayeRjL3Pxk18BOFSAs7ONv1j9eT49STc5uaLfHr3mnBHOV9d
 SRpG/ORYGEMHyb7xhlXvIK5b6RU7ULyXNKq+z+1o=
Date:   Wed, 13 Apr 2022 13:13:03 +0200
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v3 2/3] phy: core: Update documentation syntax
Message-ID: <20220413111303.GB25550@tellis.lin.mbt.kalray.eu>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
 <20220407102108.24211-3-jmaselbas@kalray.eu> <YlZnb2dJjaroDfyu@matsya>
 <20220413095349.GA25550@tellis.lin.mbt.kalray.eu> <YlafAkEQq81R4MGC@matsya>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlafAkEQq81R4MGC@matsya>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 03:29:30PM +0530, Vinod Koul wrote:
> On 13-04-22, 11:53, Jules Maselbas wrote:
> > On Wed, Apr 13, 2022 at 11:32:23AM +0530, Vinod Koul wrote:
> > > On 07-04-22, 12:21, Jules Maselbas wrote:
> > > > Update the syntax used by the documentation of phy operation functions.
> > > > This is to unify the syntax with the newly added documentation.
> > > 
> > > Is there any reason for using this sytax, is it documented somewhere..?
> > > How does this syntax help?
> > 
> > I don't have any particular reason for this syntax, this syntax have been
> > suggested by Randy Dunlap.
> 
> Is this documented somewhere?
Yes this is documented in Documentation/doc-guide/kernel-doc.rst:

``%CONST``
  Name of a constant. (No cross-referencing, just formatting.)

My understanding is that this formating should be used for the constant
NULL and not for literal values, such as 0.

What you do think? Should I revert to using a straight 0 in the return
value doc?

--
Jules




