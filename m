Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F53A76DBB3
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 01:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjHBXnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 19:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjHBXnG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 19:43:06 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0712102
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 16:43:02 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-56ca4d7079aso227954eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Aug 2023 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691019781; x=1691624581;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iCIkKYuEvI9DbHxXEyPwyeEJFv+eK4ymUNUeDelXG/A=;
        b=IzajTiMjWj0anpk7fUmYoLXOzxMMtLRlYhSXbgOBVrH49GoFUjKUEns2jvlmSid1eY
         pbgQdtU+tf7aI64WdKLVyiimbcPhD3li17sjbcqe5pftcfQdcgg22zc2ktP3KWfnqPQZ
         qawKIBkesL2Z9zun9JvN0tViM8/g1MCqeDLtPW4tY4fFBMwTLcke1YVSksSTHLXBSPjD
         lzcolPPz0gl2sYun+98jwW71aoCFlk2sH6ozVBVAdNzoctnO6jofCc/qJ1cpQbqViMsR
         PblcNYZ7Wx7oeBVt+TDgqte+nVkS2Dg/rXeujD8+ZFjwZ+PVTqCBZLw98IjPxrdWFTnR
         +OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691019781; x=1691624581;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCIkKYuEvI9DbHxXEyPwyeEJFv+eK4ymUNUeDelXG/A=;
        b=RUA/XhI5F95QfSJdXSVWZesOxsn35f/fn+leqXlTC8GyzVBdfdWpKyIYJlabVxNBBA
         afuyIfJ/0b1WSBG7LKVk2ZpUjVPmK9Vt/FxI7NO5vMlkyqZYunWhwpgkHCFdw5Oq6coJ
         FfwXpRrOFC36iBJSVWWxjKPKA8XRlHZGzaof97I+ZKJZOIyjpLNQsyJp/0Ve9vsUENze
         6uNfkvNJtD07IGcT07a/pRETyB+h0OCm6lWHe8HN9ixoyZB31QM5xdxJCjz5wuIDkx/l
         Kj3VXSVnxbtw94wSVMw9xb4zyEiMxj8U1Tt4kI/Y8ecBrzh4jQmNPWDBjLiTzrvtv/kr
         oL4w==
X-Gm-Message-State: ABy/qLbCMAQZpEPsokhi2aGLw2TP5Ge4fZ58ZNbpc7X3S0PwrwA+aJRn
        iLSWcJ/eo2U8KcDzZrSG6t/bN6K7rDoAxcpdpiE5BZBd+RNhVw==
X-Google-Smtp-Source: APBJJlHj1z3wtXkHTwnLcYjGjmqMwxYvnrJL2/gXnLUj71Wb6SMfFkkVeSp2QkkJOLJF/QshqlDrkapm8QTY5TUA0t8=
X-Received: by 2002:a05:6870:969e:b0:1bb:8867:f7ef with SMTP id
 o30-20020a056870969e00b001bb8867f7efmr20021680oaq.25.1691019781465; Wed, 02
 Aug 2023 16:43:01 -0700 (PDT)
MIME-Version: 1.0
From:   Ron <ronald.du.igt.linuxml@gmail.com>
Date:   Wed, 2 Aug 2023 16:43:53 -0700
Message-ID: <CAHA0pnyBgFPbU0X6Ywe28ERcKcoB2LwfVEju6RXCS3SMRZS_RQ@mail.gmail.com>
Subject: GadgetFS ep0 OUT transactions immediately following SETUP transactions
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello everyone,

Thank you all for the help!

I'm trying to modify the GadgetFS kernel driver to be able to handle
Vendor Specific Out requests to ep0. All of these transactions are
occuring on ep0. Right now the host is sending the SETUP transaction,
then an OUT transaction with vendor specific data, which is followed
by the device sending an IN transaction to acknowledge the whole
request. When polling the ep0 file descriptor in userspace, I can
receive the Vendor Specific SETUP transaction and the respective
bRequest, wValue, etc values from the SETUP transaction. However, I
can't figure out how to also get the data from the OUT transaction
into userspace. I have tried modifying inode.c for gadgetFS but am not
sure where to begin to do this.

Thank you,
Ronald Du
