Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC43E7380C4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjFUKyI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 06:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjFUKxh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 06:53:37 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B24E6E
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 03:52:37 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 498445C00D2;
        Wed, 21 Jun 2023 06:52:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 21 Jun 2023 06:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687344757; x=1687431157; bh=Yk
        dpW/yKT2RmoIKvlf9fUhI16MHnBi8dpMb0H6etl7Y=; b=PzVci6P5BATITpHzrj
        4nUJull61G+D/8FbNt3z6CeQkBPxTv27JAwG4qZJbeOx5x0wg/tbmt7kQ9MOBWs6
        PP8G46Ryu9vgmhNbDQ86VoEyB1mIocUlqkl0RVJZlGVkhTHjWHRBM119zqLJWgJn
        Bx8+23iFq84zRYAxKUWNpAeWjeKSXqmAXj1rTH490lzynjH7mmxxDfNC6yXOhjny
        cIcmlT/KHfZjRlQJf515VU30dwFZ1bH5D85np2Nu+TyJfYjyaCWcrsKDAdf9z5oc
        TrpmQu0bdge3jQa+OqrOa/pq37MQKsW4Um7tt/tEj7myHLusxp1Speiam4sh7rbc
        owwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687344757; x=1687431157; bh=YkdpW/yKT2Rmo
        IKvlf9fUhI16MHnBi8dpMb0H6etl7Y=; b=SszXg48kbZamuIKiLlvY4G+OVOWvO
        89p9CjHWH79UBZrcgh0PR328jyZUwH8SCKtcv2zzLWhEdbOQOsjYJmf2dSTEL1jR
        wrsHK1Lx8o0yCn2DFoAJ130ry1mul9tDtP36+AadVl9GMP4iuxsi6KdKWkUuaGld
        hd5PBp2yp971eZl4iCK1C7syUSgc9Ngj5ebIuMSwS91o3I3Lqb+q95jHAKvlLJ45
        xVR81BsFEr205dXsRAy/6QO0Fsh1wjanbhcLnWuJMUBFGNKrBFUeWjmYHdsQ1ZjY
        WqerbFoyaf0gIGExatYpkxSSfdIZp+x6lUd7GHPiXr78pFtSANFW6DuDA==
X-ME-Sender: <xms:dNaSZAWgAqr-uh_7xPYpvyNEJ3tHZeEIC_hx833PRSk_UdWy5hK76g>
    <xme:dNaSZEm8dOGQhli56OP4eE9Im8D6CIZ-SZf_1ZTn8T1NK4mZ8y6XhvJi4umVNcvLq
    w8A7TlK2DPJ3w>
X-ME-Received: <xmr:dNaSZEYZirg_9SqU659-V2N86vCKimRJD2Ey4YxeRw4WoewcjQqegftVIxnvFtKFKGY76t9J1hdK6VqDDP1HTfN1lrf8OsT44Qv9xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:ddaSZPUS7erhQcGFp6Kh_Xwa7z8Vlf_QT2Wssp497kgGY9y2wwYBtg>
    <xmx:ddaSZKn0GDIWsVORxITHwPoxTSb6ozQoBzHVLmx-bw3d1LmOZgDj2A>
    <xmx:ddaSZEeeIlszAvLCYhm6m_wgT6pXFcQxDjelwXgTrJAVVoHdn6mvJA>
    <xmx:ddaSZF8yUkbMh9n0BZ-Ll46zwkSeGlSjXr_cSMR4-plsG81Mhdu1Gg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jun 2023 06:52:36 -0400 (EDT)
Date:   Wed, 21 Jun 2023 12:52:32 +0200
From:   Greg KH <greg@kroah.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU
 based on CLx
Message-ID: <2023062153-barterer-condiment-c209@gregkh>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
> From: Sanath S <Sanath.S@amd.com>

Why "Internal"?

