Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A42C9DE65
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 09:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbfH0HHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 03:07:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41400 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfH0HHb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 03:07:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id j16so17599198wrr.8
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2019 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=igLAingkpYqEs/zxkqz2EsVOV1BHQwqtDExbKFAKDhI=;
        b=Xsfebv3645ieD4rOjVyUVQvuRMqcx3VWiY2GQ1mcIoJMWVDg2/R8oxbTb+P0iXKLDl
         PpBUpUB3PVomIQ9QIR383h4ZD0f2bGWTNjWGNMZfO0zJJeMJOrZTMKMTlP1OCSjLjz6M
         JSSk2iUXbluweDhw5pct0BcfixKBNy5SgE5j7K7tJ4rkO1kvE8oUbPP3sdQOLM2pFooP
         U7d1Sx7S07y45RRQSUID4kzpMV7by4M+dsntEW+0IkTIC5J8+uHnogl+4FrdNKN6uftg
         0dH04fH9OB7wPqBLaDCa6gBto69QJcjMzexxhWKK35gl1CNfrImskqn4fkrnqAwztuha
         eLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=igLAingkpYqEs/zxkqz2EsVOV1BHQwqtDExbKFAKDhI=;
        b=FNJ5Q6lnsm6g3uV74hHUkxhgA4NjPPJsVPVdVb5fYBI6MddRyAcs+IwbcZxBd8afSK
         qnhyw4hB+AeKx/LoknWLTb/zzg8lNuZXp696IqDr5q9z2OihUFKYP4LtaGJ9Bpz3g+1L
         l3v1iUwWx+mxWw817O9X6r+HKq6NruLJ3tIRDuO2A7YYGZnzB47w6l/oCvOpdF2qiMx+
         Izung5Ty1PiqbdX0G+4mYw+rL011//jDmgra15F5xOPRPUN5/qPubPXv8Dsaf4qa56Bp
         /M12EFVFa2bYCEuJZnirmEHBpXfJlWSkOz/RBZECa9CyXNO18kqFtAyLIJ+0XhK1LLFe
         p7rw==
X-Gm-Message-State: APjAAAUXzEYQLsrYfaRWcdWGMVO07T+9aPcUAwuiHl9t925lta8LiyVY
        OSxESesg1IBwv7vMpQMuePp7BKtXhQBq1wUlqFqE3bwR
X-Google-Smtp-Source: APXvYqy9tqa/PprTH9Q2PMeNmwGfrkj9gQkomeDhp42vhbMIw8+A84SKzdGiRjw+7/gIm3QVkiqZ6yxK6XIAsa7mf94=
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr27035926wru.43.1566889649527;
 Tue, 27 Aug 2019 00:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190701122114.2952-1-charlesyeh522@gmail.com>
 <20190701133233.GI27333@localhost> <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
 <20190701152942.GA3787@localhost> <CAAZvQQ6JDgkC2SD4eYzBVYhq3ApMwWc_-gXQQVMBH+CaXZSK5A@mail.gmail.com>
 <20190716083312.GA10939@localhost>
In-Reply-To: <20190716083312.GA10939@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 27 Aug 2019 15:07:18 +0800
Message-ID: <CAAZvQQ7NL0svem1ihw7SB+CFbhGt4J0OdN8sZ0bn3Cx_HE8uDw@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B47=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Ok, thanks for confirming. Note that I asked you about this back in
> April (15 April).
>
> In that very same mail thread I also pointed out that you must not
> ignore review feedback. Even if for some reason disagree with it you
> should at least explain why.
>

I want to explain or answer your question..
but I am not familiar with using inline gmail
I will try to reply to your question using inline gmail later..

Charles.
