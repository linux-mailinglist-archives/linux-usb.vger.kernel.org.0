Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D358585AD9
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 16:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiG3OqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jul 2022 10:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbiG3OqP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jul 2022 10:46:15 -0400
X-Greylist: delayed 914 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 30 Jul 2022 07:46:14 PDT
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C71F15FDD
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 07:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659191404; cv=none; 
        d=zohomail.in; s=zohoarc; 
        b=DC5H6VY+nDGEff7sZ/DCpBn+giYGFa88u3I9XVuocBFTSKuLPhH4wrSw7ION4aHFyCeWT8TAwiTJVrrNjHPBk8TZ056uNjdbuPHfC6WiqBXjvr0k38dGTucmzYSBxDkywSXWHFqYQnxzUXQ1fB4fGiS6QuhnfcwgzlDdfikvcDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
        t=1659191404; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=sNEu9xVlYITWJUFczaZLlumaqmemSbO5V03iFSSY+L8=; 
        b=Bd3CG1mohX7aQ2n9FP6MvMeFbMrYJjB/VNjxejINJ9gTBFs90CyEDyon9oWXLcVNFNCCnJtXp7D1IzbY5CPIMuwPSxpYG21rnFzSDWRABibNiguo9rnP+Y2Cr85lexsHFx5fJCSN7qrcZxnYItJH9+7yNYdqnEsK1vv6wEXSuT0=
ARC-Authentication-Results: i=1; mx.zohomail.in;
        dkim=pass  header.i=siddh.me;
        spf=pass  smtp.mailfrom=code@siddh.me;
        dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659191404;
        s=zmail; d=siddh.me; i=code@siddh.me;
        h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
        bh=sNEu9xVlYITWJUFczaZLlumaqmemSbO5V03iFSSY+L8=;
        b=RrlOVl3Q/Hso8dY0oUZyPydpNFvh4cOm1PAnBsStOU8HpJ/bPZ/vGyqmJH6LPrW/
        JXdHbWR4ZFDggwiDASbtQFjtbTccFxw1WBC4aDWeeqtLU23mtRhMJk3pP3RdMM2Vnfk
        NZ2ZQTGNARWCsulwuVoG1GXmQelceDYMvqvh+6Oo=
Received: from localhost.localdomain (103.249.233.127 [103.249.233.127]) by mx.zoho.in
        with SMTPS id 1659191403160210.57781571685632; Sat, 30 Jul 2022 20:00:03 +0530 (IST)
From:   Siddh Raman Pant <code@siddh.me>
To:     syzbot+aa620fb1ece874a3f34c@syzkaller.appspotmail.com
Cc:     Julia.Lawall@inria.fr, andreyknvl@gmail.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, hdanton@sina.com, jannh@google.com,
        jj251510319013@gmail.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, schspa@gmail.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Message-ID: <20220730142957.6765-1-code@siddh.me>
Subject: Re: [syzbot] KASAN: null-ptr-deref Read in ida_free (2)
Date:   Sat, 30 Jul 2022 19:59:57 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <0000000000006fecd605e234a41f@google.com>
References: <0000000000006fecd605e234a41f@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since this is fixed, marking it as such.

#syz fix: USB: gadget: Fix double-free bug in raw_gadget driver

