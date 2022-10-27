Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C47160F906
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 15:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbiJ0N3n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 09:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236084AbiJ0N3m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 09:29:42 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBAB24BED
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 06:29:38 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id m125so1974554ybb.6
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=T+Rx2002o8zQcs1gOwcoCppH/PTT0C3o4P365iLcezJKVe5Y6eKYlgGGXvT/kIqGie
         UMOmST+2EWHdHpbdyQjOBVsq/oRZMXlZi8saLEAg9O1jqnSXCIQu9b63RHiLIlLINVDv
         2WCdvx2BHKh1SkeXA0Gct6EuGxe5vyNBxSzcxQQ0M1D4ak7dGrAZCZPu3cxdXEfDNo26
         3QnLb9q5LcaZ6aqGPvq/x0hiA6eVd61aEih2gPFzL+4Gljb8YV/Yi/T3Pef1TsCy458E
         OptFWMBraQwqCHKEQ769de3KDuQ3NCSM7pnZEjsCH//3f5541N/pjkLfRW6Bat0P0r/T
         xoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=yO8vmCley3eQO0bhK53kMyHda6UA3D2v3mtfF1xoo984v4u0qPVl+cRpIuIouJFIAm
         66xM1LJZKTMED3b0gkqzfeE6IItX+UJkyjKej5rQ1HnGpQ3drp7eOGtEA9M8oTtSfs1R
         UtqMPGYrlqXJJc30RARC9nLzhlscenR4d48wUzGSvjoug33tLIcd7/8VozQ9kmEZqVse
         CS7lgANUbHN2V8mgSyHo21yFcY7dY8Xu7MFe2tVe11gw3fLKANk7MKuyhf7JvkpE55pT
         afSWv0QOblBtdkwtVUPki6yCg8GrPAgwaIMERC5nvG0K69pN9trD+g3a/VgaR0/0/gAj
         DnlQ==
X-Gm-Message-State: ACrzQf3vB1HjetQV2weAxftVKfHJj60K3JsrJX4wHx6z6ilChsERRh/W
        1k8OM1OMAeI7PGUmvVVz4itYDcib/poCxoSstS0=
X-Google-Smtp-Source: AMsMyM5yIQYNonxDv8QbeRQSmJcSxNfY3HN/sYB/+sLGGcLU/faUev7MwNgHWwWJ3H4F42h3qOBVGJS70O7HYO6Iw4Y=
X-Received: by 2002:a5b:84a:0:b0:67c:1db1:2069 with SMTP id
 v10-20020a5b084a000000b0067c1db12069mr43126974ybq.507.1666877377861; Thu, 27
 Oct 2022 06:29:37 -0700 (PDT)
MIME-Version: 1.0
Sender: chrisdickson3030@gmail.com
Received: by 2002:a05:6918:b290:b0:ef:f22f:8736 with HTTP; Thu, 27 Oct 2022
 06:29:37 -0700 (PDT)
From:   Chevronoil Corporation <corporationchevronoil@gmail.com>
Date:   Thu, 27 Oct 2022 14:29:37 +0100
X-Google-Sender-Auth: 7aZRsiPf_wlv_Aw-KRCXqIvOPnI
Message-ID: <CAJ3gWOCYwAAGQe2LzO1MPrPq1w_bMDRHQrucZ1o5bpYOqjaj4Q@mail.gmail.com>
Subject: INTERESTED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

BEWARE, Real company doesn't ask for money, Chevron Oil and Gas United
States is employing now free flight ticket, if you are interested
reply with your Resume/CV.

Regards,
Mr Jack McDonald.
Chevron Corporation United USA.
