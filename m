Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86A7750EC1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 18:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjGLQlK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 12:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbjGLQlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 12:41:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D9E69;
        Wed, 12 Jul 2023 09:41:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E91361830;
        Wed, 12 Jul 2023 16:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE92C433C8;
        Wed, 12 Jul 2023 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689180059;
        bh=B/5PsCg3B8TWEnV/7QCpalAnjklbQnYY+T5WlsDJH1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wJnM3kLZpdT368vjbI5B8SYo0XZgzh89IyOahuQvEIR1ikwLd04ZuNqJGjyN+ssLV
         Ovi1HEwydr81yQRensEKlGEnAEHcn+22PtxVxaemRcm9ir9xZuaTi5jsdJE66Z4C3L
         NM7y/okdtTCy1k8kwY32uQv/dY9IwIs20DoVPaB4=
Date:   Wed, 12 Jul 2023 18:40:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH V1 0/3] Add notifier call chain to Embedded USB
 Debug(EUD) driver
Message-ID: <2023071218-woven-oversleep-444f@gregkh>
References: <cover.1689148711.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689148711.git.quic_schowdhu@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 12, 2023 at 01:52:37PM +0530, Souradeep Chowdhury wrote:
> This patch series adds the notifier chain to the Embedded USB Debug(EUD) driver.
> The notifier chain is used to check the role switch status of EUD. Since EUD can
> function only in device mode, other modules trying to do role-switch on the same
> port have to first check the EUD status by calling this notifier chain and based
> on the status proceed or block their role-switching step. The modules can call
> the notifier through the call eud_notifier_call_chain and pass their own
> role switch state as the argument. This chain will also be able to handle the
> scenario of multiple modules switching roles on the same port since this can
> create a priority and ordering among them for conflict resolution.

You are adding a new api that no one is actually using, so why would we
accept this at all?

And how can we actually review it without any real users?

thanks,

greg k-h
