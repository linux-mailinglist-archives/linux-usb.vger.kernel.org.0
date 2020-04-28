Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662731BC537
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgD1QbF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 12:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbgD1QbE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 12:31:04 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE17C03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 09:31:04 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id 10so6052460vkr.7
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=F+eAn2E/J+zNkM0ZtaMnhLdJDXKznalZV00lErNyU+Y=;
        b=K5pmt/JGnEsU00Sy3pDYoK9+3E3tvd4Ar0VQ/EP9Wx84uQyhzOws6c8t7yvJ3LpRc8
         EBADpw/y+IHvIqsXON1SsvREL1KDh5N256kA/xH5+Iq6N+BAEO+ZdnYEnvDeHGo/pSZG
         ouzu15tp72zEutk7GkKOMcKj7VD6mU4nfvmPwLHFgZ3bwxptrGmguA7rsLKscL6wHrKy
         uETpI4X1ubMmpBqMvz/zHtdWYp6VNku9o05b7oHVMMjydRHmDn+CWpkh6uiNamAMPeGk
         UWXT6RPlFEUBQzHsSbc61uDjVtCUy+SgUsUJ+4V3VEQ45rT5rSmxPy/LW2+awFY2BOtM
         qmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=F+eAn2E/J+zNkM0ZtaMnhLdJDXKznalZV00lErNyU+Y=;
        b=lohvVRiJ3Ihi3Kn1kwavjDvOaLKEoH/0INd20wD+A1DHyh4a3zvg0X9Uz16FDP4Slc
         rlqEocBYsut7gSEXDT2Sp7f+tYg6pyipARWtoZvmx8D2Z92Kainj0hyVRY/kHsq0ri2w
         9YZqnUGarNEBRnoV/FOvd5GtYMpBQk9P+fyH/FWZNFiB4raUbpKUmD1BGVdXkapgd5+Q
         6cb+hiyqnVmfoJpHx1WrDLczGw1hiqKtPlsO0ZdS5Zw+nDCRqTMi9W3RP+DWhEZutvix
         iRwSvqrpgnM3TeYxXnDStValcxbLH6+981HLXUDM6kBXtybHMa2UugjiK/wszuFFyW1r
         oxOA==
X-Gm-Message-State: AGi0PuazsAFLVfqaobAyo6G1QFBJ2Bs9ts5tm4cpFa09WGH2gblaO/TY
        BEkPaqoUHzAi8fd5Ju7F05biWLTou5vPZjhNXcU=
X-Google-Smtp-Source: APiQypJoXR25BOIY+e521LDHRP4stx2lATbRGfy4krFYcrASOz0sLfzVFAlJZ8kLy7WhNr4t5FAqjZX+Bke6wRQpdGQ=
X-Received: by 2002:a1f:4586:: with SMTP id s128mr21953777vka.90.1588091461952;
 Tue, 28 Apr 2020 09:31:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:efd5:0:0:0:0:0 with HTTP; Tue, 28 Apr 2020 09:31:00
 -0700 (PDT)
Reply-To: kennethjj51@yahoo.com
In-Reply-To: <CABxVXzRMOg65f5rGoEq5Vvg=Q8ywOdMDCise-2-QPLPHKsQeDw@mail.gmail.com>
References: <CABxVXzQ1hZBL1D2mVDtzi77OuFyX99Oh5PNFQXyKqrm=CmN98g@mail.gmail.com>
 <CABxVXzRFF-XoshH1w2eRJD=LthxoiF4kQWTy0LZ-tATA4O7a7w@mail.gmail.com>
 <CABxVXzT1DSaogUA_kwS3nd059=Qhivv--CxQWaUitDH1pY5xGA@mail.gmail.com>
 <CABxVXzQEOKawBq4UvLtc23cWN4dB2UEBT7yWPvX+hZvmxk33ww@mail.gmail.com>
 <CABxVXzT=tS4in7QXYLrHany=v_ZzOCEbZNUMOUqBm00Xnyr+aw@mail.gmail.com>
 <CABxVXzSP2jgpJO35dSUDQ6KKYa5kyRjFd5KbvWza4mxx9go=zg@mail.gmail.com>
 <CABxVXzQGAsyyf4tRK0WK1DBbPq=eQWyism8_yP_0zdc=1Nv8Og@mail.gmail.com>
 <CABxVXzTW4hHJmCkcwShExUtmNAiYgXS-__C4jd0dbzTcST39Jg@mail.gmail.com>
 <CABxVXzT5T_9i7ZvN-h47hNp882q-vibBG5hNDkh5YZg34x5dHw@mail.gmail.com>
 <CABxVXzQvjBxuY6YtVOx-5d_SbzmGUkeT1s2btN3zVR1EEkcxAg@mail.gmail.com>
 <CABxVXzStqXjGwyLdJhK=b0uK7MLk1skUHHbzkGtK+pnrWBY6_w@mail.gmail.com>
 <CABxVXzScm6DoV142F=+4s3EiXANUivJ5V=7GkrGpKrqUFDUBEw@mail.gmail.com>
 <CABxVXzQ-uYyjPpkMx7Z5paszGub+ykTJ-uat-L2cUAYUAbMkew@mail.gmail.com>
 <CABxVXzSwdcN5w=d5GyuQmQ2hrAwLTAv7paESYyMrW=bH9b6dqg@mail.gmail.com>
 <CABxVXzQ=3==--H3t0u=S2EuGi4ZO-EE8rk8dH7Nam2b8Mo9i+Q@mail.gmail.com>
 <CABxVXzQOTAMk-c86we33apJTJAV3rm04yWytkgH4w1-Ky8mOhw@mail.gmail.com>
 <CABxVXzRtrTeh7NHSN7N7N+-09BxCaoKezo4_ibXkuLrT=C0rJQ@mail.gmail.com>
 <CABxVXzRkpZ7OudGSxhPwLyLKR87E4303sfQWHaOwepk-0N+sDQ@mail.gmail.com>
 <CABxVXzTuvrXaavwb7y=g4C+VgHK2Ru52HWGvi9B8VKAGJF-Wzg@mail.gmail.com>
 <CABxVXzSWCcn1X579eg+a-sArK=xykju6sy92dmw17AzgixznKg@mail.gmail.com>
 <CABxVXzRfz0380VvNreyPE0RS8rpA4BtAmMNzVjB_o=jeOkte4g@mail.gmail.com>
 <CABxVXzTi+OyVgtM=-iah-LPXkni8nMk385ntOhMSQM6myc7MyQ@mail.gmail.com>
 <CABxVXzRyrNSwjjbjOj+h22UZTVZ5-s2e=db6uq0+UhXZq+HVag@mail.gmail.com>
 <CABxVXzSQssqyax4OzU1cx632UxV3itkpdwW+w+PrP9gEhjtS6A@mail.gmail.com>
 <CABxVXzRp4WgPLbWz=xq++SqQgwfgUbM4vQ-Q5a-gM+VE1WUvWw@mail.gmail.com>
 <CABxVXzRQ-2UC84tx8DXMeM+-GGkedsRZTJkb9rsAeqLH51zCLQ@mail.gmail.com>
 <CABxVXzQCyH6cGzi0SQvbBFu9VSNP6Z7f9d5NgVb=41_A3Cuniw@mail.gmail.com>
 <CABxVXzTT5QqZN9raoZ3Jr+eQmiAbL9qYzEGOM1sbCv4nP5KoHw@mail.gmail.com>
 <CABxVXzSN4Xfwste2+Z7AP-iR9GK_3bfEjYLgeiAz96yg-qJucQ@mail.gmail.com>
 <CABxVXzQOvG2DbBt4F2WmDam7wUBv+SvuviJ5X4_m=5Y-ADX3ag@mail.gmail.com>
 <CABxVXzQikATNV=TDQoes2dZT5q9U=gxCTSz2rk37V3vn0vf+XA@mail.gmail.com>
 <CABxVXzTNoOoBvLmxv-HOkBmt9f71L=k7tsxDp0wW+P=YuSMeuQ@mail.gmail.com>
 <CABxVXzQcOAb8_5F53pX_3-XHw6jtY7OEuNGGnamkzwyJqn1NGA@mail.gmail.com>
 <CABxVXzQQC822QxP4fCrrWVWDSFJ8NYR7XeHVEZC-BTXbLTJB2w@mail.gmail.com>
 <CABxVXzTSCaHy7g5TEHNQ1XiAnUDc6toiK7NNe6DhzEgAYux07g@mail.gmail.com>
 <CABxVXzQO6fdwACpDcZ_2=OhTNwdnN7XMmfEcdAdE+mNKZ-NxFw@mail.gmail.com>
 <CABxVXzTySE5wDfed5Q53o2k7ZfRVjGuuQYNh23RuY4T_wKTjtA@mail.gmail.com>
 <CABxVXzRs1Xdbvb0vMj=sYFip1arweqwSD=fv-KjGT=rBNS9nWg@mail.gmail.com>
 <CABxVXzQ_H-+Yq-xicLmgEHcMgT-Kq1c=dPLjvZoOwtNd5jjdfg@mail.gmail.com>
 <CABxVXzTD+HDmPC_j2QfYzr32swjavBwA+YN1sLMZmv+AiOw9nQ@mail.gmail.com>
 <CABxVXzRfKQjK8QPnCCqQdLs2_PAXfCUAsnAaW0jX1JXmaS6gkQ@mail.gmail.com>
 <CABxVXzTdOaRbFZ6QZdpA+h9MqKR4qmbAQq4aqPCgUvNp8DDMPw@mail.gmail.com>
 <CABxVXzTkqHzCwna7Ka7bya7nr-rr7tOUYfAJk1PW=+WPnO0vBA@mail.gmail.com>
 <CABxVXzRutOCyi6LH7O2brrqJDp0zRN1XN7YUJKJ0EhCXcnfX2w@mail.gmail.com>
 <CABxVXzRsrXtJ122Bi=acAi0Z_5bT_K4Dd3z223psmad2dXhTrg@mail.gmail.com>
 <CABxVXzR4NcziR1YnA9txDK3ETzpsXic=fa60zZAe78Tuc8YLBA@mail.gmail.com>
 <CABxVXzRkdivffYkcACzEaAqiSWouyNTzVNW6Khuxa2Z7oRStfQ@mail.gmail.com>
 <CABxVXzTBK73e_YAnXM=sLVYbmLRta=1RYYOh4j8CKHgSftRhFg@mail.gmail.com>
 <CABxVXzQ+EKjHS6UHCTjk=sRXMAQmab+v5+UbZOVxAMn-hi9DqQ@mail.gmail.com>
 <CABxVXzSP+6y-LunqPdSrQvY2gDGUub-13s1aXM6+O40GqYCAQw@mail.gmail.com>
 <CABxVXzTUVSAvBCUtuw-Z2vY2jzgsCA6jRL5g1R12RWdDo+hTKQ@mail.gmail.com>
 <CABxVXzT8i6RP1xOS1xey8p=CQ9bqMy5GYBjn5_BMiGo4f0Dskw@mail.gmail.com>
 <CABxVXzSSjd7Z1vQpMb7J5Y9Qs4==93jqMeLaCF3mZuR2Psw_Ow@mail.gmail.com>
 <CABxVXzRem+baEecVsrDHpBbx_HPCWXKsve_WkZ_TuCBNTnUTBw@mail.gmail.com>
 <CABxVXzSav+NDdzyHpE8wTR91xcQxJh7HXO+8bsfLCDij4x3rNA@mail.gmail.com>
 <CABxVXzQr6giZKowO72pRBeshe4fGC9AFOs90ihh=BBLQrN3=tQ@mail.gmail.com>
 <CABxVXzSDcBKuZJWmVG4_BZQU5Y4hVQvGHJmtfC1jvE-vYz8JAg@mail.gmail.com>
 <CABxVXzR7T1=rmNtq82RPF0GQYJfWQW_j_b831n46n1xtdrMqQQ@mail.gmail.com>
 <CABxVXzTon+468o2P8uuLCAjvqArxhZtQRrnkZ9AoPU-YzMdhdw@mail.gmail.com>
 <CABxVXzSxoHj5E4pM9p4BfNt7PwZwrm6igc0KeZokQOFazhsvGQ@mail.gmail.com>
 <CABxVXzRNx0A29DQP=MU9BW4hS7f3Pv6E_yC4pCj5O9SXEE+m=g@mail.gmail.com>
 <CABxVXzRyPBcF+jDJswQoq8nq2VqLWr-KCR-=BV1-8pfMi2wM7A@mail.gmail.com>
 <CABxVXzQN929mFwMpSHbXtDu42OD5Kuwq3BQbA3X0yiq9YHi+mQ@mail.gmail.com>
 <CABxVXzRFKnF4ZEjzcj_ZJHHEDeSoOQiJupiWQwX1jk4SFTBtGA@mail.gmail.com>
 <CABxVXzSdi25XdhHPXct2npfd0sYuiUXui4JBvev8c7vQ4Fei9A@mail.gmail.com>
 <CABxVXzR77BtK4hi0yk+LjqSbN14oVzJ2RBz9jvV5+VzWGCspzg@mail.gmail.com>
 <CABxVXzTzT3_aGYgMdKi7Wj39B+2AV=XL2gvCZMOMeyUu=dqA5A@mail.gmail.com>
 <CABxVXzTbCB6kRXv7NuN24u=O6Rp+DbKBxxiaKOn8ja3rM_1R7Q@mail.gmail.com>
 <CABxVXzR1mi7usxhSusiYTzh_yAHqDuXGu8yYcfLoVx1iC5JPvw@mail.gmail.com>
 <CABxVXzTtGf3NN+Q_eoZg-7_WNAuBMveYGa1AaBxbG13nS8++8w@mail.gmail.com>
 <CABxVXzTxzEyj=ytGMsCz3GptAD7MrL9qd=oDOth23i-kuuwzvQ@mail.gmail.com>
 <CABxVXzQwUWYqCoTEaYG+HwZ+83_pNYtTerneDKNN=RQQtQAQSA@mail.gmail.com>
 <CABxVXzTanWCrga8Y1N434bf9Y0KgU0rFa_wkLtD8yes+sagaVQ@mail.gmail.com>
 <CABxVXzTSZ3=KNm_gPicM=PD+exeL5srV-tMbHO3X3+tx3WSTNw@mail.gmail.com>
 <CABxVXzSXNfcCX60h+gO64D90F_2U8oxEpVsQBNXD_xMdU_fRqw@mail.gmail.com>
 <CABxVXzQ3oNodHDts4ciTV0fv3swH-BctyBrVFhQW5kQ7Uj8qmA@mail.gmail.com>
 <CABxVXzRRmj9y=d3znw4=Lhqz=RGVYK8c96PZHc9r8p9REkcJeg@mail.gmail.com>
 <CABxVXzTnVFzqjCnRwXD1xBCytO+W4n62yRm7KErWCTEyhqPorA@mail.gmail.com>
 <CABxVXzTmcKXRo7wLfdA0sxqJRW3k7rO=CS-Lu53=4QCZExhNuQ@mail.gmail.com>
 <CABxVXzQXcXZ6NyJYjQ2Hi=4gtV9Rw8UjWgJmu4FyzfLAC3gkOw@mail.gmail.com>
 <CABxVXzTWr1A0gO8BXpKkbW=CiQ=je4ej96mZ1LngV=yXLwH1KA@mail.gmail.com>
 <CABxVXzTvVtaWMqq2RvFijS_42SLCidBPujgatcE_QU8icU-eoA@mail.gmail.com>
 <CABxVXzQyBWqLLtJHr0tTFwyuqjk2SkDcvxicCrH5GkN17RkFAA@mail.gmail.com>
 <CABxVXzQE1bzSLhQ3gdTvjYBD5rR3oMbjR2T+nNcAAsk6pCfkkg@mail.gmail.com>
 <CABxVXzQ1j1OnCk0HPN1wOVnMsG2frst1DJb520vX8DsnJK2RdQ@mail.gmail.com>
 <CABxVXzTrEvuZqktJfGyjuydK9gRWpYzjow_3osqHCBgbtJ_Nbg@mail.gmail.com>
 <CABxVXzSdSZdN4QxmUrYxx92gqZin-RaRZ7x3zKux4uFk4RHegg@mail.gmail.com>
 <CABxVXzT70GhAAdrH0GH=Ezi-1D7MSp4cOw3imTrtOnASdxOLZA@mail.gmail.com>
 <CABxVXzSk0o11gA6XOE6tjytY-spSdHQt47yx8My7izcVnt0OKQ@mail.gmail.com>
 <CABxVXzSH0bqY=eip1_9j2W23W4+gWe6crT322viLp-G6-FJssw@mail.gmail.com>
 <CABxVXzQevTygbZmfJFVTeU1vT3Cp+mB5aWK0B5kJQqPABCe8ow@mail.gmail.com>
 <CABxVXzStufh1a3USqb+XAW-LJejgHNSstJHdOjj2VP-9+doHzg@mail.gmail.com>
 <CABxVXzQ8epKE8GjUTkz-Za2gze6MmWD4xZErHBSnVnzoUy0NbA@mail.gmail.com>
 <CABxVXzQPxZLQkEx2EPoOZVpypBqSQ6MS6kuYo6dzqpOjCcdGyw@mail.gmail.com>
 <CABxVXzSbV4+cQ4n6hsoJfYg-VBNd0X1yt1tRn3wim6A2773hHA@mail.gmail.com>
 <CABxVXzSqBOcbMr6HR05XM877_6s_eVpciPB4OmEjRQx3Y6tySQ@mail.gmail.com>
 <CABxVXzTOFK68hXYviFO=zgqrxBb27afHV369DGecLkOOGjzgzA@mail.gmail.com>
 <CABxVXzTFCb_nLFKuZFuGzANO6o4n68yeCDbOVrZgnBeCqU-fQg@mail.gmail.com>
 <CABxVXzTwJ49QrN23AEie8PyTtw6CBX=ey=Xxsuyy7tmxBxcFsQ@mail.gmail.com> <CABxVXzRMOg65f5rGoEq5Vvg=Q8ywOdMDCise-2-QPLPHKsQeDw@mail.gmail.com>
From:   Kenneth Johnson <ngonidzashamat@gmail.com>
Date:   Tue, 28 Apr 2020 09:31:00 -0700
Message-ID: <CABxVXzTFr57vvms5b-EnD46x5TM72Le=9Wpi3Qt5hW=hpHOysg@mail.gmail.com>
Subject: INVESTMENT MANAGER
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
I am Kenneth Johnson working with a business consultant.
There is a transaction of $1.4 billion dollars here that own by Arab
man if you have interest you need to come down to Gambia discuss
percentage with him.
Regards,
Kenneth Johnson
