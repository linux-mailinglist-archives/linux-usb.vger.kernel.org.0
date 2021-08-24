Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8A13F5896
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 09:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhHXHBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 03:01:03 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33465 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231292AbhHXHAn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 03:00:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 3081E3200B11;
        Tue, 24 Aug 2021 02:59:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 24 Aug 2021 02:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=M
        1Rys/cbt2m24GLZZYpuqs+PZup9jE9LqcPVi5aHYCk=; b=w2dwNisJIs9/Mho5J
        9Z9+N7rXH7lfPg8EQMDA4jjGQbJHToGY146+uuiPHmOdNb3695OJW9pwHJUJnl92
        CeSV+yXjb6S1cqgEkCRweUvdh8tPcHczUp8vUJsPHBUGttwAyQwcWSpBGC/7q7wV
        x/61HTNoK6XCs/7iaGQl+oiV/u3O+vnxJCxw04CMPlCetXd5Rt89L7h95kBx5lM+
        3Uq06jNvtLG9/5591eMnWjQ5+wKo0zhbpkfzzvkkwWl3hapt7IXtbhg7TMyc1Ziy
        iPZnQxYvo2xcxtbKUq18kbfeZLy2vHAjHEo3SL4Mz8Gaz1EodNpPmy2+RaDIuC3/
        3DpJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=M1Rys/cbt2m24GLZZYpuqs+PZup9jE9LqcPVi5aHY
        Ck=; b=qWP5EcCwedvxfe8akynPME7B5vZp7ZYQ0xQX3ad+UQMb0TBPVS7tmMW2Q
        e7CTcxiSgho20W+GmpdrL9uvScnkYuqMzgQ5fKBgYIyp2H+v8sZkYzzeSBct/Vcs
        dAXehc9CecVI33dj8LxzD8/aLXpPXyF8cZKBg6lYjnTTdWgcXZ+pqWWlVxZOuh0D
        qUlykdgHn6FJcyfysdfpzlCYzkTiof72fEGVyfRCHlTq56of5aW7yhAOX/px8b9V
        o6vmUzeUtAJr4qLe8dguEaTAi8lxKOuwwREXk3dWiAr4LyIQjEymwLk0MiykKFef
        KcpLKzrziC8sbpUDV01BwGudl6Wcg==
X-ME-Sender: <xms:7ZgkYQgFND5LnKpfsjhvJ29qZgbbZ5DQemn3sLbvdjVFhV27l3rIpw>
    <xme:7ZgkYZBwARQR0SJ4vrCwO4Qp-OmE9cWfumRXFrFJPJ3pxcrpI066X08k1Cn7SceFs
    bSm4x6q45ZROA>
X-ME-Received: <xmr:7ZgkYYGl3mvrTCdxOXNeC1jtDr_1Ewiuu0ziV_vAewejUQVY6LkqZTMl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesth
    ekredttddtjeenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtgho
    mheqnecuggftrfgrthhtvghrnhepgeeijeeuvdffuedvffdtteefuefhkeehgfeuffejve
    ettdelgfeuudffffetfedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:7ZgkYRTKTazeQqJncH2wwsxx-NbJjYQUhyEL40YmHYvLXOcU8zHs9g>
    <xmx:7ZgkYdzGYB-XQh7Fpabwh-nX1QJPOdNej5nbQPIcmOL98ntn9MXS_A>
    <xmx:7ZgkYf7vlOoUeW1dly8bveLCuTIN50jOxYeIFz9tgGDjtaVzUVcdpg>
    <xmx:7ZgkYY9Tk0Xgp-30Ej5e__7qbNna9cG3xApW6RJK9P8YiQevvp_gjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 02:59:32 -0400 (EDT)
Date:   Tue, 24 Aug 2021 08:58:53 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 214155] New: =?utf-8?Q?regression?=
 =?utf-8?B?IDUuMTAuNDnihpI1LjEwLjUyOiBEaXJlYw==?= =?utf-8?Q?t?= firmware load
 for renesas_usb_fw.mem failed with error -2
Message-ID: <YSSYrfcewaIfHP7j@kroah.com>
References: <bug-214155-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bug-214155-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 24, 2021 at 06:54:45AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=214155
> 
>             Bug ID: 214155
>            Summary: regression 5.10.49→5.10.52: Direct firmware load for
>                     renesas_usb_fw.mem failed with error -2

This should already be resolved on the latest 5.10.y kernel release.
Please upgrade and let us know if that does not solve the issue.

thanks,

greg k-h
