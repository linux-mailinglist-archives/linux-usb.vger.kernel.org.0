Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3143774F56D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 18:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjGKQdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 12:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbjGKQdC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 12:33:02 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F007CA
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 09:32:50 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so94730221fa.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689093167; x=1691685167;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=WFibieZ2v0r4nWPy0J1wGTrFtOXxVksWo9Ycvtk6r1viqsBFsWV1+2Luw0tJWYEc2d
         EybaDJGcl9KBnd0R2+PpSfAnadC6cUCuzXIeMjWw73PxDtrOeheXj3MKd/apxW9S3ScJ
         Bl58mCaKB5LUAOIUynXr102zB7CYguU8HSAJLcDpZc+IWY8x5SiZcHZRkmcdW0/ue2oa
         8aXF0EdL9nkFqQ8NQ6NYa+DFo+gCiYHKk0xm586Z7LI3nLfD/P1f+sXgZTNlbdV9CQLJ
         zPkvhLIsOegU5GpzkADKnE1GLB+w6gcz5zA7aFFk4hLsPcOTQHM9yDbvmbKV8wZAXdVk
         LFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689093167; x=1691685167;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=dRC5tq0H5JRdNnj04xbWOcrZm7WreAAn99bGai6gqYhXWzu4LieRyTInqrL6fysYCE
         sgpVDFvGcxsJQP/sN1OpFSron+8YF/VrJddso6qqHZnWYxP+Y1tpJis73ufYMsXXS3NL
         wA8BLHSGsQztIh76EsLLJ8tGEdgxAIyM7iQPtn2gn2DPXHLthePBzNtEmLuW130a7Q1V
         3xYoqTKieA7Ewj5T73oAXxZqx1w/NiXnL93ythVQBd2ht9zY/KUEUvoogo4o1KikMIUa
         OHe7b1wlBnE40fdRU+sKLNxen4MPDd85CDfGY/7hSQnlf6evvy5QaTzefoXE99C32/b2
         mWdA==
X-Gm-Message-State: ABy/qLZwa3pqxicYsg9ldGIWWJIpXt0+RTS54oIAK3EOEFD0BvmNRuNq
        UpmeANA6d6h/F9YcU8T+14U57ffZ7Aq5352VkCk=
X-Google-Smtp-Source: APBJJlH1If/svLi3ZvVSK9N5XCgAEROHhzB3qlp5M8M0oO6v2qngfJe3MewXHmdWauY1GePpYxisCh5XUDIQqNBIkDk=
X-Received: by 2002:a05:651c:120c:b0:2b6:fc80:c45f with SMTP id
 i12-20020a05651c120c00b002b6fc80c45fmr12883371lja.13.1689093167200; Tue, 11
 Jul 2023 09:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:1c16:b0:986:7a95:9cc0 with HTTP; Tue, 11 Jul 2023
 09:32:46 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <nd4846496@gmail.com>
Date:   Tue, 11 Jul 2023 18:32:46 +0200
Message-ID: <CAPadVRx=24t+dtCfxOJ-H_QTG0496dY-ZfFTyFRXoPSEnRePwA@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXqteZINep157Xl9eUINec15TXkteZ16Ig15DXnNeZ15og16nXldeR
INeZ16kg15zXmSDXnteZ15nXnCDXkdei15HXqCDXnNec15Ag16rXkteV15HXlCDXkNeg15kg157X
lteb15nXqA0K15zXkteR15kg15fXldeW15Qg16nXkNeg15kg16jXldem15Qg15zXqdeq16Mg15DX
ldeq15og15fXlteV16gg15DXnNeZ15kg15zXpNeo15jXmdedINeg15XXodek15nXnSDXkNeg15kg
157Xl9eb15QNCteQ16DXkA0K
