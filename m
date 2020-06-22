Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893F520314F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 10:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgFVIEb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 04:04:31 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44123 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725788AbgFVIEb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 04:04:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F07945C1FEB;
        Mon, 22 Jun 2020 04:04:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 22 Jun 2020 04:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=nwU8wNCod4IaT7IMdx+xqFHmuXI
        khyVcTMIfSTPRVBg=; b=V/gsFIEJXKnoCewOMVgd8DFwKPjkH8d0TvST3GDb/Xh
        1elOgMiTmrE3p3ISUE48QEWwoofNFR5lln4MafG9s7lKxQ6zSi/jti287kzYMag+
        XY+rqzHsb3fcygjSlpEfmzkU1tbeSGc0kkfk/o/NIgcB3iluPx9cVHqBOzsjq/f5
        WNp6XlsH6DH3LSZrpuHYsQz0Blbv9xYYZ4Kn2sZg9q4eSTkwhSWM8ts5YXB1T4vL
        LsDkULZ09lrGPgDp78Bt9BagsDArEINbNMenvfnIx5negNUovN7NRECRD9qQy4+6
        DYkmR0hpj4DWaSlRpQFitTgKVFxhYvNzOGcvaXhbMIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nwU8wN
        Cod4IaT7IMdx+xqFHmuXIkhyVcTMIfSTPRVBg=; b=tfWT9q3lBZAc4ImRpHXt9d
        cWRzKVVUq5rdReAxA2+v0NuaXvPF2e/TkSwksjUFRkalQOPKDR6zxQqrAOd/Lv94
        89iEUGenOAZwxb92eDoZjw6d10b500s0odV5eyqraOC06QOU1lQ8xCuyJuTpE5Kd
        bTL5hYinzRBCs+e7X8BHnw7RnIRR8MKtOkQ3p8RQyIvL9TbfH0ghq6KPIBOdBzrC
        FuhFv38sZ1NnvLTHPgSOB6dv08xBJHaD0qGxwpCapYTHEKBohkrgGX+6osJACujY
        PyH7Lfc2kq+3iuttoJjcpebUUN5S9RD0N13G4yebXWe0cFzTfGjVD853jdPPNYiw
        ==
X-ME-Sender: <xms:DWbwXoiNzTcuwHdH71nFG1c1frF9-R6kiUxU6K0ruCU9NuRBomETJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertddttd
    dvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekgeeiff
    evheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeei
    rdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:DWbwXhCPAyGpQMy3WimC2_Ot-oVn-_Z0xdYn8HdLk-7U8bmOtNxGpw>
    <xmx:DWbwXgGiLPtUgL96-us-Vuf08VLlahjWo0lfHyzgs0wddzOHuqU7sg>
    <xmx:DWbwXpRMXYdfmxUeIPBAxhURGyZ5I6mYC8ISo5g-8pobaxqkrBEUPg>
    <xmx:DWbwXk8hX1WSvlKaEaUFTd5Nrn_iHasCkpY_EZ9NLf2Cv683xq3XNw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7DC7B3280059;
        Mon, 22 Jun 2020 04:04:29 -0400 (EDT)
Date:   Mon, 22 Jun 2020 10:04:25 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208267] usbip broken with latest kernels?
Message-ID: <20200622080425.GA3363284@kroah.com>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
 <bug-208267-208809-FXk5whnRcB@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208267-208809-FXk5whnRcB@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 05:03:25PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> --- Comment #3 from DocMAX (forum@docmax.my.to) ---
> yes 5.6 works. as i said, starts with 5.7.
> i haven't much experience with git bisect. need some guidance.

the man page for git bisect should have lots of guidance, see
	man git bisect
for the details.

To start, do:
	git bisect start
	git bisect good v5.6
	git bisect bad v5.7
and then follow the prompts from there, building and booting the
resulting kernel and saying 'good' or 'bad' depending on what happened.

If you have specific questions about this, please let us know.
