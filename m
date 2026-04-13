Return-Path: <linux-usb+bounces-36217-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD5sHH9I3WmmbwkAu9opvQ
	(envelope-from <linux-usb+bounces-36217-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 21:48:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7886A3F2E93
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 21:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B034D301BDA1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 19:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7EC3E3C51;
	Mon, 13 Apr 2026 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1o0mPLi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3D3909B0
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776109636; cv=pass; b=gV8OiFICj/L4T+iSsbXytgOg2VSvdaVubx0J7y8qz73Cio5frveF6m7ISeueW9dMXYKaN+bKmrtc5vq9m9IMaKQCESgP3WBv/wvM9XwGHfmW/ft9y102Neo4HLEqRY3cGRz70CZQJJmHQr6lSpF/BZOK2/rWFBmdfeCjY1bmMwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776109636; c=relaxed/simple;
	bh=dCx0BgeP0S4iPQNUJynu0bwg/Evju3Rd90eyN3QC9wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxbBDfXPhpruv2PqZN1gFXpgZX6gwd0qZBfXt5yR3ETXJeLf8KBoC0d1OjTDDiuaoB5qVWLH53K8oAEz7CSuPh45mxYLuPyid9LVXZ7T1A1BiOmDR1A7zDjoWBD6zdfM8ALYz0S7vqEh4DJBhz4aGkiMGcq0ZNnPZ/nOiEtt6TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1o0mPLi; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b941762394aso586110366b.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776109633; cv=none;
        d=google.com; s=arc-20240605;
        b=TiB36KkGETZ5/QQYunfrOE6aS1Z0yIpSR7pu3X3lZeH2JFc524ftTm7xHi3fCF8TEp
         vfdakWKsTqKiIV29DTjuKMSZv/N+6f9VEapG0pOI5bmPf9S6yTgh179aS2vQ1rM9sGFT
         rZ81HAKXB+ETQ5KOKKQRRCdVjHFMPLX8MH3xyPi4Nrlz+3ar0KC8TPX6iMqMY57yR9iY
         X311BOFZvMuEJZbIa2JYt/JMEzbkV1okZBwCIoSwdqlS67VFJU++tCAgAolcSfas2QqN
         aXk8ZW0TVhPry3C5c4f4NSlJATEPvKWh/G9QnJr7jTDmFAQx7fALyMiQUQt+VXRXkWzO
         8VzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4aauW7rIckYMi6KppeMuYBAZ0kgUOmrEq7Mca9Sx1s=;
        fh=PIhAgsaJq8JRruAdIVFwZAxhe3Q4ldcRSyMDcV4ZcRc=;
        b=Paa1Y+c39m2fT5WIuqJDIyVyksti1na2UDHThhLB9osi0AeAblj/9l5QtyMnVWIpt9
         57IdBv51LXlDQy0V9GkIDfssJ/H1wSg5hwN7Acyj6O7iBiBZE3wxeDTg1YwkPfrqOrP2
         Sh8LW5ClkbAHgZXZWqQ0gYiZQHvSbCk7JMYnmevbQEeBW472PQCog7DCErjdPccLqKau
         lTGam6CtqniY40jvfEFvdnCpM3xqELz49yLD0AE7vRlIn6Ut/qRchKKUWKehUtwDE5Hc
         qoxBFgXDHG4lFtnzZIKzgh6WfKPVrp5nuXDJagY8gc5AJrYO+IvDqXzSJyU7dTJAsmkt
         +3Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776109633; x=1776714433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4aauW7rIckYMi6KppeMuYBAZ0kgUOmrEq7Mca9Sx1s=;
        b=d1o0mPLi7oxqk/L8zqIe4b/83Hf8YZ+EAQnwRnWOXv2N4EKRivcTU9dqbb1ensQXEs
         lKD+FXl0Gh4RqXGZAQ9NjlSHSNosN+Z01Ez4ig8+phCEewBToCM5EWKjDpqTanWtS26G
         +1jjPsM50hpXz5MP3krtGOs2FqL+a38oePDMk4rGuhAWPei64suiNRXxiUn28/ZWPVmH
         J99IvmOwUbsxPLOHQTPTwcSS+et3DLefeMH87+tWj5KRIYKvjpBIV1jmEP0ZLdlghwvH
         gHDbu2mCYcZVc/O1tfxh0LTR3snHBdQvWIjgFGMWhPPG3TqSgMqia7TvC9+XRYNz4jCf
         KYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776109633; x=1776714433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4aauW7rIckYMi6KppeMuYBAZ0kgUOmrEq7Mca9Sx1s=;
        b=Hf/aeDmOkn4kkI/6TWy3SXOeVnOhOU4MXwjBBidYvjDLCWIHoI2eWe0TGnTE6IfpVL
         RuVpn97xt9LsK7M3ivNW46xzdlD2ALE/suS+TH53srB7n2Jxpr9yGYVtuKju4qjRghrX
         1GFTPGyiCDaE4zjpnjVp+qhq1y71HJ5UqYNCj9WjbgqkkKE4LULhz0cAep3kqVaXbygK
         Wa7+59Q9mmSObIKpBDivVEr45WJoMWSTKfLQlzTgR7USAXmTCOPf8W0w7NrLiNpQvBAi
         vyvpCxb3+yVpdGEYy/n9+CwVHhB+5nBXo/d6AN8o4H/YjBW8dtxtcgEzJO/UH2RvITib
         8VyA==
X-Gm-Message-State: AOJu0YzPlbZF4aYWAVIHEtcIu3TzcWrA+p0vy3QqtuseqBgr4aLAdZPt
	CdFUxMvl47Q8RXZC+tg79NNn/UWzMpeG7qNQdvX+R9GFevLeKZ7ueZGTVFNW8I0VLomEXVpsygM
	kcCN+MJHofduMF+fN3mQQBTDA8fZnS6A0Jw==
X-Gm-Gg: AeBDievmb5+jkwKEq2ZMJsDcs+wj/d4pPw00VSV9N3VWcPu/ma1qnusWVmIpcKV7/vW
	eTuQgQ26M0HcCjsqNDj81SsQc8IW290+acGvuW8PnzwIA2ubHbedUFV8hLpOHOjCDY5829U6foU
	JW1cdlDyQlc9EzW2iKMOrFNY0jqe0y+vD/dgn5sMDjdCbHwWWBB6fBbiZbMOG0gsBLx/UxUPIMi
	tPS3KR7DwCol5+X0n0Vtu/iiqJ0/bTCzg16ceK8dAEGA1I11mkb+vIhNcSmloTNCEtvyX7OwN2Z
	GE2hN5wpb1wlayU9QGUk/w32dqmY+/umtvmC+QoivnqVt4XvLioxF2xcSaFL6FSYqwQdEAWJ7Uf
	dwDaGVdE8FHl2Wfp8
X-Received: by 2002:a17:906:9fca:b0:b98:4f24:a6d with SMTP id
 a640c23a62f3a-b9d7249964dmr899921366b.11.1776109633144; Mon, 13 Apr 2026
 12:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411023642.146890-1-rosenp@gmail.com> <202604131654.9GEXISW5-lkp@intel.com>
In-Reply-To: <202604131654.9GEXISW5-lkp@intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 13 Apr 2026 12:47:00 -0700
X-Gm-Features: AQROBzCLUeMWLW9XnCCf_p-1qKj0CJB3Mwj1tUaY9VjQWSQTO6tl6tvfzd6JKQE
Message-ID: <CAKxU2N9wF8ekpzu39CTx3jRA3wj=cQ=dbN8jcUXtLTmpwD_Oxw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
To: kernel test robot <lkp@intel.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36217-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 7886A3F2E93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 1:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Rosen,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbol=
t/next linus/master v7.0-rc7 next-20260410]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/usb-ty=
pec-intel_pmc_mux-combine-kzalloc-kcalloc/20260412-223212
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> patch link:    https://lore.kernel.org/r/20260411023642.146890-1-rosenp%4=
0gmail.com
> patch subject: [PATCH] usb: typec: intel_pmc_mux: combine kzalloc + kcall=
oc
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/2026=
0413/202604131654.9GEXISW5-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260413/202604131654.9GEXISW5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604131654.9GEXISW5-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/usb/typec/mux/intel_pmc_mux.c:740:3: warning: variable 'num_po=
rts' is uninitialized when used here [-Wuninitialized]
>      740 |                 num_ports++;
>          |                 ^~~~~~~~~
>    drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: initialize the var=
iable 'num_ports' to silence this warning
>      735 |         u8 num_ports;
>          |                     ^
>          |                      =3D '\0'
>    1 warning generated.
Yikes I forgot to do this. As the merge window is closed I assume this
needs to wait.
>
>
> vim +/num_ports +740 drivers/usb/typec/mux/intel_pmc_mux.c
>
>    730
>    731  static int pmc_usb_probe(struct platform_device *pdev)
>    732  {
>    733          struct fwnode_handle *fwnode =3D NULL;
>    734          struct pmc_usb *pmc;
>    735          u8 num_ports;
>    736          int i =3D 0;
>    737          int ret;
>    738
>    739          device_for_each_child_node(&pdev->dev, fwnode)
>  > 740                  num_ports++;
>    741
>    742          /* The IOM microcontroller has a limitation of max 4 port=
s. */
>    743          if (num_ports > 4) {
>    744                  dev_err(&pdev->dev, "driver limited to 4 ports\n"=
);
>    745                  return -ERANGE;
>    746          }
>    747
>    748          pmc =3D devm_kzalloc(&pdev->dev, struct_size(pmc, port, n=
um_ports),
>    749                          GFP_KERNEL);
>    750          if (!pmc)
>    751                  return -ENOMEM;
>    752
>    753          pmc->num_ports =3D num_ports;
>    754
>    755          pmc->ipc =3D devm_intel_scu_ipc_dev_get(&pdev->dev);
>    756          if (!pmc->ipc)
>    757                  return -EPROBE_DEFER;
>    758
>    759          pmc->dev =3D &pdev->dev;
>    760
>    761          ret =3D pmc_usb_probe_iom(pmc);
>    762          if (ret)
>    763                  return ret;
>    764
>    765          pmc->dentry =3D debugfs_create_dir(dev_name(pmc->dev), pm=
c_mux_debugfs_root);
>    766
>    767          /*
>    768           * For every physical USB connector (USB2 and USB3 combo)=
 there is a
>    769           * child ACPI device node under the PMC mux ACPI device o=
bject.
>    770           */
>    771          for (i =3D 0; i < pmc->num_ports; i++) {
>    772                  fwnode =3D device_get_next_child_node(pmc->dev, f=
wnode);
>    773                  if (!fwnode)
>    774                          break;
>    775
>    776                  ret =3D pmc_usb_register_port(pmc, i, fwnode);
>    777                  if (ret) {
>    778                          fwnode_handle_put(fwnode);
>    779                          goto err_remove_ports;
>    780                  }
>    781
>    782                  pmc_mux_port_debugfs_init(&pmc->port[i]);
>    783          }
>    784
>    785          platform_set_drvdata(pdev, pmc);
>    786
>    787          return 0;
>    788
>    789  err_remove_ports:
>    790          for (i =3D 0; i < pmc->num_ports; i++) {
>    791                  typec_switch_unregister(pmc->port[i].typec_sw);
>    792                  typec_mux_unregister(pmc->port[i].typec_mux);
>    793                  usb_role_switch_unregister(pmc->port[i].usb_sw);
>    794          }
>    795
>    796          acpi_dev_put(pmc->iom_adev);
>    797
>    798          debugfs_remove(pmc->dentry);
>    799
>    800          return ret;
>    801  }
>    802
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

